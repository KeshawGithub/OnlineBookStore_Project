# 📚 E-Book Web Application

The **E-Book Web Application** is a full-stack Java-based web project developed using **Servlets** and **JSP** for the backend and **HTML, CSS, JavaScript, and Bootstrap** for the frontend.  
It provides an online platform for buying and selling new and used books with two main modules — **Admin** and **User**.

---

## 🚀 Features

### 👨‍💼 Admin Module
- Login and manage the complete system.
- Add, update, or delete book details.
- Manage user accounts and orders.
- View and handle book sales and purchase requests.

### 👤 User Module
- Register and log in to their personal account.
- Browse and purchase new books.
- Sell old books by adding book details and price.
- Directly contact the owner of a used book to negotiate or purchase.
- Manage personal orders and book listings.

---

## 🧠 Technologies Used

### Backend:
- Java Servlets  
- JSP (Java Server Pages)  
- JDBC (Database Connectivity)

### Frontend:
- HTML5  
- CSS3  
- JavaScript  
- Bootstrap 5

### Database:
- Oracle 

### Server:
- Apache Tomcat

### IDE:
- Eclipse IDE (Maven Web Project)

---

## ⚙️ How It Works

1. **Admin Panel:**  
  - Admin can log in securely.
- Add, update, and delete books.
- View all users, orders, and books.
- Manage both new and old book listings.
- Handle book inventory and order details.
- 
2. **User Panel:**  
- User registration and login.
- Browse, search, and purchase **new** books.
- Upload details to **sell old books**.
- Directly contact the book owner for old-book deals.
- Manage their orders and personal settings.

## 🗂️ Project Structure

E-Book/
│
├── src/main/java/Ebook/
│ ├── AdminServlet/ # Handles admin functionalities
│ ├── UserServlet/ # Handles user functionalities
│ ├── Curd/ # DAO layer for CRUD operations
│ ├── DB/ # Database connection classes
│ └── Entity/ # Entity classes for Book, User, Order, etc.
│
├── src/main/webapp/
│ ├── Admin/ # Admin JSP pages
│ │ ├── addBook.jsp
│ │ ├── allBooks.jsp
│ │ ├── allOrder.jsp
│ │ ├── allUser.jsp
│ │ ├── EditBook.jsp
│ │ └── AdminHome.jsp
│ │
│ ├── WEB-INF/ # Configuration and protected JSP files
│ ├── all_component/ # Common UI components (navbar, footer)
│ ├── bookImg/ # Book images
│ ├── imageEbook/ # Static images
│ ├── index.jsp # Landing page
│ ├── Home.jsp # Home page after login
│ ├── register.jsp # User registration
│ ├── userSetting.jsp # User settings
│ ├── SellOldBook.jsp # Old book selling page
│ ├── allNewBook.jsp # Displays all new books
│ ├── allOldBook.jsp # Displays all old books
│ ├── viewBook.jsp # Book details page
| ├── MyOrder.jsp # User order management
│ └── And many more pages are there..
│
├── Libraries/ # External libraries (JDBC, Servlet API)
├── Deployed Resources/ # Web content deployed on Tomcat
└── README.md # Project documentation



---

## 🧩 Future Enhancements
- Integrate online payment gateway for secure transactions.  
- Add book reviews and ratings.  
- Implement advanced search and filter options.  
- Add REST APIs for mobile app integration.

---

## 📸 Screenshots
<img width="1901" height="871" alt="image" src="https://github.com/user-attachments/assets/b69ad8e4-1706-4064-8be0-4375e8e3ca18" />
<img width="1897" height="869" alt="image" src="https://github.com/user-attachments/assets/8382a4e9-f972-4c71-898c-ccf044482b8e" />
<img width="1919" height="869" alt="image" src="https://github.com/user-attachments/assets/b83405b3-64d2-4707-b18c-2e2cb5d9def2" />
<img width="1919" height="868" alt="image" src="https://github.com/user-attachments/assets/2cd2d4c9-40b9-4ee4-80d3-8bbc5875ae42" />
<img width="1887" height="868" alt="image" src="https://github.com/user-attachments/assets/83dda85e-8431-484f-99ef-d12b620c0338" />
<img width="1900" height="868" alt="image" src="https://github.com/user-attachments/assets/c4829c0e-b588-49bf-9b57-4178be896094" />
<img width="1902" height="851" alt="image" src="https://github.com/user-attachments/assets/7185a606-536f-4907-9766-f9c9500b464c" />








---

## 💡 Author
**Keshaw Ranjan**  
Full Stack Java Developer  
📧 [keshaw.so123@gmail.com]  
🔗 [GitHub Profile](https://github.com/KeshawGithub)

---

## 🏁 Conclusion
This project demonstrates the practical use of **Servlets and JSP** in developing a full-fledged web application.  
It’s a complete solution for managing an online bookstore — simple, interactive, and efficient for both users and administrators.





