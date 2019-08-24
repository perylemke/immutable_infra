package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func helloWorld(w http.ResponseWriter, r *http.Request) {
	name, err := os.Hostname()
	if err != nil {
		panic(err)
	}
	fmt.Fprintf(w, "Olá %s! Bem vindo ao Floripa Tech Day 2019! :)", name)
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
