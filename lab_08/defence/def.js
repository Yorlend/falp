use('prologdb')

db.createCollection("telephone")
db.telephone.remove({})

db.telephone.insertMany([
    {
        surname: "Petrov",
        telnum: "+79162694425",
        address: {
            city: "Smolensk",
            street: "Krasnoflotskaya",
            house: 55,
            flat: 21,
        },
    },
    {
        surname: "Sidorov",
        telnum: "+79162114425",
        address: {
            city: "Smolensk",
            street: "Leninskaya",
            house: 11,
            flat: 2,
        },
    },
    {
        surname: "Ivanov",
        telnum: "+79169994425",
        address: {
            city: "Moscow",
            street: "Baumanskaya",
            house: 11,
            flat: 33,
        },
    },
])

db.createCollection("cars")
db.cars.remove({})

db.cars.insertMany([
    {
        surname: "Petrov",
        model: "shkoda",
        color: "white",
        price: 900000,
    },
    {
        surname: "Sidorov",
        model: "hyundai",
        color: "blue",
        price: 1000000,
    },
    {
        surname: "Ivanov",
        model: "shkoda",
        color: "white",
        price: 811111,
    },
    {
        surname: "Petrov",
        model: "opel",
        color: "green",
        price: 500000,
    }
])

db.telephone.aggregate([
    {
        $lookup: {
            from: "cars",
            localField: "surname",
            foreignField: "surname",
            as: "car",
        },
    },
    {
        $match: {
          $expr: {
            $eq: [
                "$surname",
                "Petrov",
            ]
          }
        }
    }
])

db.telephone.aggregate([
    {
        $lookup: {
            from: "cars",
            localField: "surname",
            foreignField: "surname",
            as: "car",
        },
    },
    {
        $match: {
            car: {
                $elemMatch: {
                    $and: [
                        { "model" : "shkoda" },
                        { "color" : "white" },
                    ]
                }
            }
        },
    },
    {
        $project: {
            _id: 0,
            surname: 1,
            city: "$address.city",
            telnum: 1,
        },
    }
])
