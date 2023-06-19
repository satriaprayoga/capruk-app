package main

import (
	"log"
	"myapp/migrations"
	repo "myapp/repositories"
	"myapp/routes"
	"os"

	capruk "github.com/satriaprayoga/capruk/framework"
)

func main() {
	rootPath, err := os.Getwd()
	if err != nil {
		log.Fatalf("failed to create project: %v\n", err)
	}
	capruk.New(rootPath)

	migrations.RunMigrate()
	repo.Setup()
	routes.Setup()
	capruk.Start()
}
