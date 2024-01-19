import pya
from pathlib import Path


def main():
    global filepath

    file = Path(filepath)

    layout = pya.Layout()
    layout.create_cell("TOP")

    if file.suffix != ".gds":
        file = Path(f"{str(file)}.gds")

    print(f"Storing empty gds on {str(file)}")
    layout.write(str(file))


main()
