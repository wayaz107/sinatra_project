#users
warda = User.create(first_name: "Warda", last_name: "Ayaz", username: "wayaz107", email: "wayaz@gmail.com", password: "peanutbutter")
asma = User.create(first_name: "Asma", last_name: "Malik", username: "asma01", email: "asmamalik01@gmail.com", password: "cookies")

#travel
Travel.create(trip_name: "California", itinerary: "3-day Itinerary in San Diego. Day 1: Balboa Park, San Diego Zoo and Safari Park, and Cornado Beach. Day 2: Mission Beach and Pacific Beach, SeaWorld, and Sunset Cliffs. Day 3: USS Midway Musuem, and Maritime Museum of San Diego.", start_date: "9/1/2019", end_date: "9/3/2019",
notes: "Best trip ever!", user_id: warda.id)

Travel.create(trip_name: "Florida", itinerary: "2-day Itinerary in Orlando. Day 1: Walt Disney World Resort. Day 2: Universal Orlando Resort, The Mall at Millenia, and Downtown Orlando.", start_date: "4/16/2019", end_date: "4/17/2019",
notes: "The rides at Universal were so awesome and Disney had smaller rides but were still fun. Next time will get Flash pass to cut the waiting for rides!", user_id: asma.id)
