def calculate_safe_area():
    """Calculate area with input validation."""
    try:
        length = float(input("Enter length: "))
        width = float(input("Enter width: "))
        if length <= 0 or width <= 0:
            raise ValueError("Dimensions must be positive!")
        area = length * width
        print(f"\nArea: {area}")
        return area
    except ValueError as e:
        print(f"Error: {e}. Please enter valid numbers.")

calculate_safe_area()