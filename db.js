// Creating table entities
db.createCollection("Users")
db.createCollection("Categories")
db.createCollection("Items")
db.createCollection("Orders")

// Inserting tables data
db.Users.insertMany([
    {id: 1, full_name: "Jonah Attah", username: "attahjonah", email: "attahjonah93@gmail", phone: 777425, role: "Admin" },
    {id: 2, full_name: "Kusu Yokpe", username: "blaqboi", email: "yokpe@gmail.com", phone: 2322425, role: "User"},
    {id: 3, full_name: "Kanny souza", username: "Kannybrillz", email: "kanny@gmail.com", phone: 1112425, role: "User"}
]);

db.Categories.insertMany([
    {id: 11, name: "Puma"},
    {id: 12, name: "Gucci"}
]);

db.Items.insertMany([
    {id: 101, name: "T-shirt", size: "Large", price: 1200, category_id: 11 },
    {id: 102, name: "P-cap", size: "Small", price: 700, category_id: 12 },
    {id: 103, name: "Pant", size: "Medium", price: 1000, category_id: 11 }
]);

db.Orders.insertMany([
    {id: 111, UserId: 1, ItemId: 101, created_at: Date(), status: "Pending"},
    {id: 112, UserId: 2, ItemId: 103, created_at: Date(), status: "Succesfull"}
])

db.Users.find({role: "User"});
db.Items.find({})
db.Categories.findOne({id: 11})
db.Orders.update(
    {id: 111},
    {$set: {status: "Failed"}}
);

db.Users.deleteOne(
    {id: 3}
);

db.Orders.aggregate([
    {
        $lookup: {
            from: "Items",
            localField: "Items_id",
            foreignField: "_id",
            as: "Item"
        }
    }
]);

