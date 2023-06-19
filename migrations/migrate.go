package migrations

import (
	capruk "github.com/satriaprayoga/capruk/framework"
)

func RunMigrate() {
	capruk.AutoMigrate()
}
