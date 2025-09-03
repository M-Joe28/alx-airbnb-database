# Entity-Relationship Diagram (ERD) Specification
![image alt](https://github.com/M-Joe28/alx-airbnb-database/blob/main/ERD/er_diagram.png?raw=true)
## Entities and Attributes

### **User**
| Attribute      | Type        | Description           |
| -------------- | ----------- | ---------------------|
| user_id        | INT, PK     | Unique user ID        |
| name           | VARCHAR     | User's full name      |
| email          | VARCHAR     | User's email address  |
| password       | VARCHAR     | User password (hashed)|
| phone_number   | VARCHAR     | User's phone number   |
| created_at     | DATETIME    | Account creation date |

---

### **Property**
| Attribute        | Type        | Description           |
| ---------------- | ----------- | ---------------------|
| property_id      | INT, PK     | Unique property ID    |
| owner_id         | INT, FK     | References User       |
| title            | VARCHAR     | Property title        |
| description      | TEXT        | Description           |
| address          | VARCHAR     | Property address      |
| city             | VARCHAR     | City                  |
| price_per_night  | DECIMAL     | Price per night       |
| property_type    | VARCHAR     | Type (apartment, etc) |
| created_at       | DATETIME    | Listing date          |

---

### **Booking**
| Attribute     | Type        | Description           |
| ------------- | ----------- | ---------------------|
| booking_id    | INT, PK     | Unique booking ID     |
| user_id       | INT, FK     | References User       |
| property_id   | INT, FK     | References Property   |
| start_date    | DATE        | Booking start date    |
| end_date      | DATE        | Booking end date      |
| total_price   | DECIMAL     | Total price           |
| status        | VARCHAR     | Booking status        |

---

### **Review**
| Attribute    | Type        | Description           |
| ------------ | ----------- | ---------------------|
| review_id    | INT, PK     | Unique review ID      |
| user_id      | INT, FK     | References User       |
| property_id  | INT, FK     | References Property   |
| rating       | INT         | Rating (1–5)          |
| comment      | TEXT        | Review text           |
| created_at   | DATETIME    | Review date           |

---

### **Payment**
| Attribute     | Type        | Description           |
| ------------- | ----------- | ---------------------|
| payment_id    | INT, PK     | Unique payment ID     |
| booking_id    | INT, FK     | References Booking    |
| amount        | DECIMAL     | Payment amount        |
| payment_date  | DATETIME    | Date of payment       |
| payment_method| VARCHAR     | Method (card, etc.)   |
| status        | VARCHAR     | Payment status        |

---

### **Amenity**
| Attribute    | Type        | Description           |
| ------------ | ----------- | ---------------------|
| amenity_id   | INT, PK     | Unique amenity ID     |
| name         | VARCHAR     | Amenity name          |
| description  | TEXT        | Amenity description   |

---

### **PropertyAmenity** (Join Table)
| Attribute     | Type        | Description           |
| ------------- | ----------- | ---------------------|
| property_id   | INT, FK     | References Property   |
| amenity_id    | INT, FK     | References Amenity    |

---

## Relationships

- **User 1:N Property**: One user lists many properties.
- **User 1:N Booking**: One user can make many bookings.
- **Property 1:N Booking**: One property can have many bookings.
- **User 1:N Review**: One user can make many reviews.
- **Property 1:N Review**: One property can have many reviews.
- **Booking 1:1 Payment**: Each booking has exactly one payment.
- **Property M:N Amenity**: Properties and amenities have a many-to-many relationship (via PropertyAmenity).

---

## ERD Visualization

To create the ER diagram:
- Use rectangles for entities and list attributes inside.
- Draw lines for relationships; label with cardinality (1:N, M:N).
- Use diamonds or join tables for many-to-many relationships.

You can input these entities and relationships in Draw.io or any other ERD tool to generate the diagram.
