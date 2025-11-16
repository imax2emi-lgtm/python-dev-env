# Friendly User Input Program
greeting = "Hello"

# Get user's name with input validation
while True:
    name = input("What is your name? \n").strip()
    if name:  # Check if name is not empty
        break
    print("Please enter a valid name!")

print(f"\n{greeting} {name}!! 👋")

# Get and validate age
while True:
    try:
        age = int(input("\nHow old are you? \n"))
        if age < 0:
            print("Age cannot be negative! Try again.")
        elif age > 120:
            print(f"Wow {name}, {age} is impressive! But let's try a realistic age.")
        else:
            break
    except ValueError:
        print("Please enter a valid number for your age!")

# Calculate time units
decades = age // 10
years = age % 10

# Natural-sounding output
if decades == 0:
    print(f"\n{name}, you're just {years} years young! 🌟")
elif years == 0:
    print(f"\n{name}, you're exactly {decades} decades old! 🎂")
else:
    print(f"\n{name}, you're {decades} decades and {years} years old! 🕰️")

# Bonus: Fun fact
if age == 100:
    print("\nCongratulations on reaching triple digits! 🎉")
elif age > 100:
    print("\nYou're a living legend! 💫")