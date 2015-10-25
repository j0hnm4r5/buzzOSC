
# MetatoneOSC

A little library for sending and receiving OSC messages in
Objective-C. This is a fork of F53OSC (see below and LICENSE.txt) that I updated a little bit to
work better with my own iOS projects (it's hard to find a nice OSC
library in Objective-C!).

# Usage

Just add the source files to a project and import `F53OSC.h`.

## Sending messages

    F53OSCClient *oscClient = [[F53OSCClient alloc] init];
    F53OSCMessage *message =
    [F53OSCMessage messageWithAddressPattern:@"/bla/bli/blo"
                                   arguments:@[@1,@"A string argument!",@5.82]];
    [oscClient sendPacket:message toHost:@"192.168.1.14" onPort:3000];'

## Receiving messages

Whatever object is receiving messages needs to be a
`<F53OSCPacketDestination>` and implement the `takeMessage` method.

    F53OSCServer *oscServer = [[F53OSCServer alloc] init];
    [oscServer setPort:3000];
    [oscServer setDelegate:self];
    [oscServer startListening];

    - (void)takeMessage:(F53OSCMessage *)message {
        NSString *addressPattern = message.addressPattern;
        NSArray *arguments = message.arguments;
    }

## More information

I've put an example iPhone app project, [ExampleOSC](http://github.com/cpmpercussion/ExampleOSC), up on GitHub that shows how to
use the library in context. 

# F53OSC

Here's the original readme from F53OSC:

Hey neat, it's a nice open source OSC library for Objective-C.

From your friends at [Figure 53](http://figure53.com).

For convenience, we've included a few public domain source files from [CocoaAsyncSocket](https://github.com/robbiehanson/CocoaAsyncSocket).  But appropriate thanks, kudos, and curiosity about that code should be directed to [the source](https://github.com/robbiehanson/CocoaAsyncSocket).


