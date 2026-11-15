// PORTFOLIO 4: NEXARBANK NOSQL IMPLEMENTATION

// Select the NexarBank database
use('nexarbank_nosql');

// Create customer documents
db.customers.insertMany([
    {
        customer_id: 1,
        first_name: "David",
        last_name: "Okafor",
        email: "david@example.com",
        phone: "08030000001",
        customer_type: "individual",
        address: {
            city: "Lagos",
            country: "Nigeria"
        },
        created_at: new Date()
    },
    {
        customer_id: 2,
        first_name: "Sarah",
        last_name: "Adeyemi",
        email: "sarah@example.com",
        phone: "08030000002",
        customer_type: "individual",
        address: {
            city: "Abuja",
            country: "Nigeria"
        },
        created_at: new Date()
    },
    {
        customer_id: 3,
        first_name: "Michael",
        last_name: "Bello",
        email: "michael@example.com",
        phone: "08030000003",
        customer_type: "individual",
        address: {
            city: "Ibadan",
            country: "Nigeria"
        },
        created_at: new Date()
    }
]);

// Display inserted customers
db.customers.find().pretty();

// Aggregate successful transactions
db.transactions.aggregate([
    {
        $match: {
            status: "successful"
        }
    },
    {
        $group: {
            _id: null,
            total_transaction_value: {
                $sum: "$amount"
            },
            transaction_count: {
                $sum: 1
            }
        }
    }
]);