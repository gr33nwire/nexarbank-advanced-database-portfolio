# Portfolio 4: NoSQL and Advanced Data Models

## Project: NexarBank

### 1. Introduction
This portfolio demonstrates the implementation of a NoSQL database using MongoDB Atlas for the NexarBank simulated banking system.

The exercise explores document-oriented data storage, CRUD operations, nested documents, queries, aggregation pipelines, and indexing.

### 2. Database Environment
- Database platform: MongoDB Atlas
- Database name: `nexarbank_nosql`
- Development environment: Visual Studio Code
- Programming interface: MongoDB for VS Code / MongoDB Playground

### 3. Database Collections

The database contains the following collections:

- `customers`: Stores customer information, contact details, and embedded address documents.
- `accounts`: Stores banking account information.
- `transactions`: Stores deposit, withdrawal, and transfer records.

### 4. Implementation and Activities

**4.1 Customer Document Creation**

Created three simulated customer records:
- David Okafor
- Sarah Adeyemi
- Michael Bello

Customer records contain personal information and embedded address objects.

**4.2 Transaction Document Creation**

Created three transaction records representing:
- Initial deposit: ₦50,000
- ATM cash withdrawal: ₦10,000
- Transfer from David to Michael: ₦20,000

**4.3 Query Operations**

Implemented queries to:
- Retrieve successful transactions.
- Find transactions associated with account ID 1.
- Retrieve customers located in Lagos using nested-field dot notation.

**4.4 Aggregation Pipeline**

Implemented an aggregation pipeline using `$match` and `$group` to calculate the total value and count of successful transactions.

Observed result:
- Total transaction value: ₦80,000
- Successful transaction count: 3

**4.5 Indexing**

Created an ascending index on the `email` field in the `customers` collection.

Index definition:

`{ email: 1 }`

The index supports more efficient customer email lookups.

### 5. Evidence

Screenshots documenting the implementation are stored in the `evidence` directory.

Evidence includes customer documents, transaction records, query results, aggregation output, nested-document queries, and index configuration.

### 6. Conclusion

This portfolio demonstrates how MongoDB supports flexible document-based data modelling and querying for a simulated banking environment.

The implementation provided practical experience with document creation, nested data structures, query operators, aggregation pipelines, and database indexing.

### 7. Academic Integrity

This work was implemented as an individual practical exercise. AI assistance was used for guidance and troubleshooting, while database configuration, execution, and evidence collection were carried out as part of the practical implementation.