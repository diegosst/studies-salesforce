trigger ExampleCalloutTrigger on Account (before insert, before update) {
    ExampleCallout.makeCallout();
}