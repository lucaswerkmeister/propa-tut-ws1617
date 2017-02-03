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
        if (message instanceof Integer) {
            int value = (Integer) message;
            System.out.println(name + " received " + value);
            Thread.sleep(500);
            if (sendTo != null) {
                sendTo.tell(value+1, getSelf());
            } else {
                getSender().tell(value+1, getSelf());
            }
        } else {
            unhandled(message);
        }
    }
}
