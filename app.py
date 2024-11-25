import streamlit as st
import subprocess
import os
import re
import glob
import shutil

# Function to extract module and package names from Chisel code
def extract_names(code):
    class_regex = r'class\s+(\w+)'
    object_regex = r'object\s+(\w+)'
    package_regex = r'package\s+([\w.]+)'

    class_match = re.search(class_regex, code)
    object_match = re.search(object_regex, code)
    package_match = re.search(package_regex, code)

    module_name = class_match.group(1) if class_match else (object_match.group(1) if object_match else None)
    package_name = package_match.group(1) if package_match else None

    return module_name, package_name

# Function to delete existing .scala files in a directory
def delete_existing_files(directory):
    for file in glob.glob(f"{directory}/*.scala"):
        os.remove(file)
        print(f"Deleted {file}")

# Function to remove the test_run_dir folder and its contents
def remove_test_run_dir():
    test_run_dir = "test_run_dir"
    if os.path.exists(test_run_dir):
        shutil.rmtree(test_run_dir)
        print(f"Deleted {test_run_dir} folder and its contents.")

# Function to locate the VCD file in test_run_dir
def find_vcd_file(test_run_dir):
    for root, dirs, files in os.walk(test_run_dir):
        for file in files:
            if file.endswith(".vcd"):
                return os.path.join(root, file)
    return None

st.title("Chisel Code Compiler")

# Input fields for main and test code
main_code = st.text_area("Main Code", height=200)
test_code = st.text_area("Test Code", height=200)

if st.button("Compile and Generate VCD"):
    # Extract module and package names from both files
    main_module_name, main_package_name = extract_names(main_code)
    test_module_name, test_package_name = extract_names(test_code)

    if not main_module_name or not test_module_name:
        st.error("Error: Could not extract module name from Chisel code or test code.")
    else:
        # Define file paths
        main_code_path = f"src/main/scala/{main_module_name}.scala"
        test_code_path = f"src/test/scala/{test_module_name}.scala"

        # Delete existing files in the main and test directories
        delete_existing_files("src/main/scala")
        delete_existing_files("src/test/scala")

        # Save Chisel code to files
        with open(main_code_path, 'w') as f:
            f.write(main_code)

        with open(test_code_path, 'w') as f:
            f.write(test_code)

        st.success("Code submitted successfully!")

        # Remove the test_run_dir folder
        remove_test_run_dir()

        # Run sbt command to compile and generate VCD
        if main_package_name and test_module_name:
            sbt_command = f'sbt "testOnly {main_package_name}.{test_module_name} -- -DwriteVcd=1"'
            try:
                result = subprocess.run(sbt_command, shell=True, capture_output=True, text=True)

                if result.returncode == 0:
                    st.success("VCD generated successfully!")
                    
                    # Locate the VCD file
                    test_run_dir = "test_run_dir"
                    vcd_file_path = find_vcd_file(test_run_dir)

                    if vcd_file_path:
                        # Add a download button for the VCD file
                        with open(vcd_file_path, "rb") as file:
                            st.download_button(
                                label="Download VCD File",
                                data=file,
                                file_name=os.path.basename(vcd_file_path),
                                mime="application/octet-stream",
                            )

                        # Provide a link to vcdrom with a manual upload instruction
                        st.markdown(
                            f"[Open vcdrom](https://vc.drom.io/) and upload the generated VCD file."
                        )
                    else:
                        st.error("VCD file not found in the test_run_dir.")
                else:
                    st.error(f"Error generating VCD: {result.stderr}")

            except Exception as e:
                st.error(f"Failed to run sbt: {str(e)}")
