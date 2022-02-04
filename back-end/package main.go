package main

import (
	"gorm.io/gorm"
)

type Admin struct {
	gorm.Model
	Code     string
	Password string
}
