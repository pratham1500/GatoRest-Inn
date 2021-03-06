package main

import (
	"database/sql"
	"fmt"
	"strconv"

	_ "github.com/mattn/go-sqlite3"
)

func addUserDetails() {
	var username string
	var pswd string
	var fullname string
	fmt.Println("Enter your full name without any space: ")
	fmt.Scanln(&fullname)
	fmt.Println("Username: ")
	fmt.Scanln(&username)
	fmt.Println("Password: ")
	fmt.Scanln(&pswd)

	database, _ := sql.Open("sqlite3", "./Hoteltest.db")
	statement, _ := database.Prepare("CREATE TABLE IF NOT EXISTS userDetails (fullName TEXT, userName TEXT, pwd TEXT, accessDetails TEXT)")
	statement.Exec()
	statement, _ = database.Prepare("INSERT INTO userDetails VALUES (?, ?, ?, ?)")
	var userType = "customer"
	statement.Exec(fullname, username, pswd, userType)

	rows, _ := database.Query("SELECT * FROM userDetails")

	var fullName string
	var userName string
	var pwd string
	var accessDetails string

	for rows.Next() {
		rows.Scan(&fullName, &userName, &pwd, &accessDetails)
	}
}

func addAdmin() {

	database, _ := sql.Open("sqlite3", "./Hoteltest.db")
	statement, _ := database.Prepare("CREATE TABLE IF NOT EXISTS userDetails (fullName TEXT, userName TEXT, pwd TEXT, accessDetails TEXT)")
	statement.Exec()
	statement, _ = database.Prepare("INSERT INTO userDetails VALUES (?, ?, ?, ?)")
	statement.Exec("AdminTransylvania", "admin", "HT123@456", "administrator")
}

func userVerification() string {
	var uname_verify string
	var pwd_verify string
	var ctr = 0
	fmt.Println("Enter username: ")
	fmt.Scan(&uname_verify)
	fmt.Println("Enter password: ")
	fmt.Scan(&pwd_verify)

	database, _ := sql.Open("sqlite3", "./Hoteltest.db")
	rows, _ := database.Query("SELECT * FROM userDetails")

	var fullName = ""
	var userName = ""
	var pwd = ""
	var accessDetailsV = ""

	for rows.Next() {
		rows.Scan(&fullName, &userName, &pwd, &accessDetailsV)
		if userName == uname_verify && pwd == pwd_verify {
			fmt.Println("Welcome ", fullName)
			ctr = 1
			return accessDetailsV
		}
	}
	if ctr == 0 {
		fmt.Println("Username/ Password incorrect or user is not registered.")
		return "User not found"
	}
	return ""
}

/*func addRoomDetails() {
	var roomNum int
	var roomType string
	var floor int
	var roomStatus = "Available"
	fmt.Println("Enter Room Number: ")
	fmt.Scanln(&roomNum)
	fmt.Println("Room Type: ")
	fmt.Scanln(&roomType)
	fmt.Println("Floor: ")
	fmt.Scanln(&floor)

	database, _ := sql.Open("sqlite3", "./Hoteltest.db")
	statement, _ := database.Prepare("CREATE TABLE IF NOT EXISTS roomDetails (roomNum INTEGER PRIMARY KEY, roomType TEXT, floor INTEGER, bookingStatus TEXT)")
	statement.Exec()
	statement, _ = database.Prepare("INSERT INTO roomDetails VALUES (?, ?, ?, ?)")
	statement.Exec(roomNum, roomType, floor, roomStatus)
	fmt.Println("Room details added successfully!")
}*/

func updateRoomDetails(roomNumber int) {
	var roomType string
	var bookingStatus string
	whatAction := 1
	database, _ := sql.Open("sqlite3", "./Hoteltest.db")
	fmt.Println("What would you like to update? 1 - Booking Status, 2 - Room Type")
	fmt.Scan(&whatAction)
	if whatAction == 1 {
		fmt.Println("Updated Booking Status: ")
		fmt.Scanln(&bookingStatus)
		statement, _ := database.Prepare("UPDATE roomDetails SET bookingStatus = ? WHERE roomNum = ?")
		statement.Exec(bookingStatus, roomNumber)
		fmt.Println("Room details updated successfully!")
	} else if whatAction == 2 {
		fmt.Println("Enter updated Room Type: ")
		fmt.Scanln(&roomType)
		statement, _ := database.Prepare("UPDATE roomDetails SET roomType = ? WHERE roomNum = ?")
		statement.Exec(roomType, roomNumber)
		fmt.Println("Room details updated successfully!")
	} else {
		fmt.Println("Enter a valid operation.")
	}
}

func roomsStatus() {
	database, _ := sql.Open("sqlite3", "./Hoteltest.db")
	rows, _ := database.Query("SELECT * FROM roomHighLevel")

	var roomNum int
	var roomType string
	var Tariff int
	var Available uint
	var Booked uint

	for rows.Next() {
		rows.Scan(&roomType, &roomNum, &Tariff, &Available, &Booked)

		fmt.Println(roomType + " " + strconv.Itoa(roomNum) + " " + strconv.Itoa(Tariff) + " " + strconv.Itoa(int(Available)) + " " + strconv.Itoa(int(Booked)))
	}
}

func bookRoom() {
	database, _ := sql.Open("sqlite3", "Hoteltest.db")
	statement, _ := database.Prepare("CREATE TABLE IF NOT EXISTS Bookings (BookingID TEXT PRIMARY KEY, fullName TEXT, roomType TEXT, numRooms INTEGER, numGuests INTEGER, email TEXT, Tariff INTEGER)")
	statement.Exec()

	var fname string
	var lname string
	var roomType string
	var numRooms int
	var email string
	var numGuests int
	var BookingID string
	var Tariff int
	fmt.Println("Please provide your first name: ")
	fmt.Scan(&fname)
	fmt.Println("Please provide your last name: ")
	fmt.Scan(&lname)
	fmt.Println("Please enter your preferred room type (Classic/ Deluxe/ Suite): ")
	fmt.Scan(&roomType)
	fmt.Println("How many rooms do you wish to book? : ")
	fmt.Scan(&numRooms)
	fmt.Println("Please provide the number of guests: ")
	fmt.Scan(&numGuests)
	fmt.Println("Please provide your email for confirmation/ communication: ")
	fmt.Scan(&email)
	var name = fname + " " + lname
	BookingID = "HTSYL" + fname + lname

	rows, _ := database.Query("SELECT * FROM roomHighLevel")

	var roomNum int
	var Type string
	var Tariff2 int
	var Available uint
	var Booked uint

	for rows.Next() {
		rows.Scan(&Type, &roomNum, &Tariff2, &Available, &Booked)
		if Type == roomType {
			Tariff = Tariff2 * int(numRooms)
			statement, _ = database.Prepare("UPDATE roomHighLevel SET Booked = ?, Available = ? where roomType = ?")
			statement.Exec(numRooms, roomNum-int(numRooms), roomType)
		}
	}

	statement, _ = database.Prepare("INSERT INTO Bookings VALUES (?,?,?,?,?,?,?)")
	statement.Exec(BookingID, name, roomType, numRooms, numGuests, email, Tariff)

	fmt.Printf("Thank you %v for booking %v %v rooms with us for %v guests. You will receive confirmation on your email address: %v soon. Looking forward to host you!", name, numRooms, roomType, numGuests, email)
}

func cancelBooking() {
	database, _ := sql.Open("sqlite3", "Hoteltest.db")

	var BookingIDDel string
	var fullname string
	var roomType string
	var numRooms int
	var email string
	var numGuests int
	var BookingID string
	var Tariff int

	fmt.Println("Enter the booking to be cancelled.")
	fmt.Scan(&BookingIDDel)

	rows, _ := database.Query("SELECT * FROM Bookings")
	for rows.Next() {
		rows.Scan(&BookingID, &fullname, &roomType, &numRooms, &numGuests, &email, &Tariff)
	}

	statement, _ := database.Prepare("DELETE from Bookings where BookingID = ?")
	statement.Exec(BookingIDDel)
	fmt.Printf("We're sorry to see you go, %v. You will receive confirmation of cancellation on your email address: %v soon.", fullname, email)
}

/*func roomHighLevel() {
	var roomType string
	var numRooms uint
	var roomTariff uint
	var available uint
	fmt.Println("Enter Room Type: ")
	fmt.Scanln(&roomType)
	fmt.Println("Room Count: ")
	fmt.Scanln(&numRooms)
	fmt.Println("Tariff: ")
	fmt.Scanln(&roomTariff)
	fmt.Println("Available rooms: ")
	fmt.Scanln(&roomTariff)

	database, _ := sql.Open("sqlite3", "./Hoteltest.db")
	statement, _ := database.Prepare("CREATE TABLE IF NOT EXISTS roomHighLevel(roomType TEXT, numRooms INTEGER, Tariff INTEGER, Available INTEGER, Booked INTEGER)")
	statement.Exec()
	statement, _ = database.Prepare("INSERT INTO roomHighLevel VALUES (?, ?, ?, ?, ?)")
	statement.Exec(roomType, numRooms, roomTariff, available, 0)
	fmt.Println("Details added successfully!")
}*/

func main() {
	//addAdmin()
	//addRoomDetails()
	//roomHighLevel()
	var whattodo int
	fmt.Println("Hello, how can we help you today? Enter 1 to book a room.")
	fmt.Println("Enter 2 for cancellation.")
	fmt.Println("Enter 3 for SIGNUP.")
	fmt.Println("Enter 4 for LOGIN.")
	fmt.Scan(&whattodo)
	if whattodo == 1 {
		bookRoom()
	} else if whattodo == 2 {
		cancelBooking()
	} else if whattodo == 3 {
		addUserDetails()
	} else if whattodo == 4 {
		x := userVerification()
		if x == "administrator" {
			var whatadmin int
			fmt.Println("Enter 1 to view room availability.")
			fmt.Println("Enter 2 for service requests.")
			fmt.Println("Enter 3 for food orders.")
			fmt.Println("Enter 4 for queries tracker.")
			fmt.Scan(&whatadmin)
			if whatadmin == 1 {
				roomsStatus()
			} else if whatadmin == 2 {
				// enter service requests
			} else if whatadmin == 3 {
				// track food orders
			} else if whatadmin == 4 {
				// query tracker
			} else {
				fmt.Println("Enter a valid operation.")
			}
		}
	} else {
		fmt.Println("Enter a valid operation.")
	}
}
