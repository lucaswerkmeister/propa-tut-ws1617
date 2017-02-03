package de.lucaswerkmeister.pingPong;

import akka.actor.ActorRef;
import akka.actor.ActorSystem;
import akka.actor.Props;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        ActorSystem actorSystem = ActorSystem.create("PingPong");
        ActorRef pong = actorSystem.actorOf(Props.create(PingPong.class, null, "pong"));
        ActorRef ping = actorSystem.actorOf(Props.create(PingPong.class, pong, "ping"));
        ping.tell(0, ActorRef.noSender());
        Thread.sleep(10000);
        actorSystem.terminate();
    }
}
