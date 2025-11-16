def calculate_rectangle_area(length, width):
    """Calculate and print the area of a rectangle."""
    area = length * width
    print(f"\nLength: {length}")
    print(f"Width: {width}")
    print(f"Area: {area}")
    return area

# Example usage
calculate_rectangle_area(10, 20)  # Hardcoded values
# OR
calculate_rectangle_area(float(input("Enter length: ")), float(input("Enter width: ")))  # User input