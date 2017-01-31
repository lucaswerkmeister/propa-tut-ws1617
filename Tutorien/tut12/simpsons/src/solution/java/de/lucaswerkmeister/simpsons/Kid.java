package de.lucaswerkmeister.simpsons;

import akka.actor.UntypedActor;

public class Kid extends UntypedActor {
    private int counter = 0;

    @Override
    public void onReceive(Object message) {
        if (message.equals("idiot") ||
            message.equals("muppet")) {
            counter++;
            if (counter <= 3) {
                System.out.println("Stop it");
            } else {
                System.out.println("Muuuhm!");
            }
        }
    }
}
