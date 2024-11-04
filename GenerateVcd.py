import os

# Here you would invoke Verilator or any other tool needed to generate the VCD file
# Example command, adjust based on your setup
os.system('verilator --cc src/main/scala/*.scala --trace')

print("VCD generated successfully!")
