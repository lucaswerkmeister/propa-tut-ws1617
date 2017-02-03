package de.lucaswerkmeister.pingPong;

import akka.actor.ActorRef;
import akka.actor.UntypedActor;

public class PingPong extends UntypedActor {
    private final ActorRef sendTo;
    private final String name;
    
    public PingPong(ActorRef sendTo, String name) {
        this.sendTo = sendTo;
        this.name = name;
    }
    
    @Override
    public void onReceive(Object message) throws Throwable {
        // TODO
    }
}
