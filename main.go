package main

import (
	"fmt"
	"net/http"
)

func main() {
	filesDirectory := "./resources"
	fmt.Printf("Using %s as file directory", filesDirectory)
	if err := http.ListenAndServe(":8080", http.FileServer(http.Dir(filesDirectory))); err != nil {
		fmt.Println("Uh oh...", err)
	}
}