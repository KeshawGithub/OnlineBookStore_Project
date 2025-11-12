package Ebook.Curd;

import java.util.List;

import Ebook.Entity.Order;

public interface OrderCurdInterface {

    // Method to add a new order
    public boolean addOrder(Order order);
    // Get all orders (admin)
    public List<Order> getAllOrders();

    // Get all orders by user email
    public List<Order> getOrdersByEmail(String userEmail);
}
