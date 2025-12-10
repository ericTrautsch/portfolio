package main

import (
	"fmt"
	"net/http"
)

func rootHandler(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		// 404
		http.NotFound(w,r)
		return
	}
	fmt.Fprint(w, "Hello, erictrautsch portfolio web server!")
}

func main() {
	http.HandleFunc("/", rootHandler)
	
	fmt.Println("Server starting on port 8080")
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		fmt.Println("Error stating server")
	}
}

