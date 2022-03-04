package main

import (
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
  )

     db, err := gorm.Open(sqlite.Open("gorm.db"), &gorm.Config{})

  type User struct {
    gorm.Model
    UserId  string
    Password string
  }
  Admin := Admin{UserId: "ABC123", Password:XYZ123@}

result := db.Create(&user) // pass pointer of data to Create

user.ID             // returns inserted data's primary key
result.Error        // returns error
result.RowsAffected // returns inserted records count
