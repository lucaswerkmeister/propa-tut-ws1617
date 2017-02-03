package de.lucaswerkmeister.diningPhilosophers;

import akka.actor.ActorRef;
import akka.actor.ActorSystem;
import akka.actor.Props;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        ActorSystem actorSystem = ActorSystem.create("DiningPhilosophers");
        // TODO implement
        Thread.sleep(10000);
        actorSystem.terminate();
    }
}
