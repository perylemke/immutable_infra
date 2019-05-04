package main

import (
	"fmt"
	"log"
	"net/http"
)

func helloWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Bem vindos ao DevOps Floripa! :)")
	log.Println("Endpoint: /")
}

func healthCheck(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "It's Alive!")
	log.Println("Endpoint: /status")
}

func handleRequests() {
	http.HandleFunc("/", helloWorld)
	http.HandleFunc("/status", healthCheck)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func main() {
	handleRequests()
}
