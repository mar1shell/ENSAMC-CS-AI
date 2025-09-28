import time

# Data structures
inventory = {}
sales_history = []
sales_count = {}

# Minimum stock threshold
MIN_STOCK_THRESHOLD = 5

def add_product():
    name = input("Enter product name: ")
    price = float(input("Enter product price: "))
    quantity = int(input("Enter product quantity: "))
    category = input("Enter product category: ")

    inventory[name] = (price, quantity, category)
    sales_count[name] = 0
    sales_history.append((name, 'add', quantity, time.ctime()))
    print(f"{name} added to inventory.")

def remove_product():
    name = input("Enter product name to remove: ")
    if name not in inventory:
        print("Product not found.")
        return

    quantity = int(input("Enter quantity to remove: "))
    price, current_quantity, category = inventory[name]

    if quantity >= current_quantity:
        del inventory[name]
        print(f"Removed {name} from inventory.")
    else:
        inventory[name] = (price, current_quantity - quantity, category)
        print(f"Updated {name} quantity to {current_quantity - quantity}.")

    sales_history.append((name, 'remove', quantity, time.ctime()))
    sales_count[name] += quantity

def total_stock_value():
    total_value = sum(price * quantity for price, quantity, _ in inventory.values())
    print(f"Total stock value: ${total_value:.2f}")

def check_stock_levels():
    for name, (price, quantity, category) in inventory.items():
        if quantity < MIN_STOCK_THRESHOLD:
            print(f"Low stock alert: {name} (quantity: {quantity})")

def search_by_category():
    category = input("Enter category to search: ")
    for name, (price, quantity, cat) in inventory.items():
        if cat == category:
            print(f"{name}: ${price}, Quantity: {quantity}")

def generate_sales_report():
    sorted_sales = sorted(sales_count.items(), key=lambda x: x[1], reverse=True)
    print("Top products by sales:")
    for name, count in sorted_sales:
        print(f"{name}: {count} sales")

def view_sales_history():
    print("Sales History:")
    for record in sales_history:
        print(f"Product: {record[0]}, Operation: {record[1]}, Quantity: {record[2]}, Time: {record[3]}")

# Main program

def main():
    while True:
        print("\n1. Add Product")
        print("2. Remove Product")
        print("3. Display Total Stock Value")
        print("4. Check Stock Levels")
        print("5. Search by Category")
        print("6. View Sales Report")
        print("7. View Sales History")
        print("8. Exit")

        choice = input("Choose an operation: ")

        if choice == '1':
            add_product()
        elif choice == '2':
            remove_product()
        elif choice == '3':
            total_stock_value()
        elif choice == '4':
            check_stock_levels()
        elif choice == '5':
            search_by_category()
        elif choice == '6':
            generate_sales_report()
        elif choice == '7':
            view_sales_history()
        elif choice == '8':
            print("Exiting program.")
            break
        else:
            print("Invalid choice. Try again.")

# Test functions

main()