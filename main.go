package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.Handle("/", http.FileServer(http.Dir(".")))
	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Println("Uh oh...", err)
	}
}