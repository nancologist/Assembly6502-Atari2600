# Learn Assembly Language 6502 by Making Games for the Atari 2600

# 1. Introduction
## 1.1. Motivations and Learning Outcomes
### First Words
So this is it.

The genesis right.

Welcome to program games for that Harry.

Twenty six hundred.

Thanks for joining me.

My name is Gustavo petty.

I teach computer science mathematics here in London and I'm going to be a big structure for discourse

in the next couple of hours we're going to break the terrorism apart to bits and bytes understand all

the components and how things are being program for the Atari 600 guys.

I'm sorry to break it down to you but chances are that if you intro for a course that is called programming

games using assembly language.

You are my type of people.

You are in a safe zone.

There is no way out of it.

We're going to have fun.

Don't worry.

We're gonna start very slow.

If you have experience or even if you are a pro developer chances are you're going to learn something

new right.

Yes.

The authority 600 is a very minimal kind of small instruction set.

That is the beauty of it.

And that's what some people ask me like.

OK.

Gustavo you are a college Processor right.

Why do you territory 600 shouldn't you be teaching all the kids kind of to be more productive.

Shouldn't you be teaching this whole new funky web framework web pack or maybe in the back end dysfunctional

programming technique that makes everyone kind of be more productive and make the big bucks.

Yes.

Right.

I.

That's the thing that I have to do.

It's like paying taxes.

This is what you have to do.

If you want to be a productive practitioner in software engineering yes you should go and we don't have

to do that.

But Gustavo why the territory's 600 Why did you pick specifically that territory 600 honestly I'm not

being naive here.

I'm not being naive or just my whole approach is not just nostalgia or the sake of gaming.

There is an opportunity by looking at something as small and that's minimal.

And with this small instruction set and there's no hardware architecture that is the interpreter 600

that it's almost like limiting ourselves taking a step back limiting ourselves in order to expand ourselves.

So in order to understand this monster architectures that we have today the processor memory the display

set the stack all these things.

Right.

If you have an iPhone a night my iPad these machines that can processor they have memory they have the

stack and they work with the display.

They work with pixels being activated and decorated being rendered on the screen.

So that is kind of my approach and the whole point is it's not just me being nerdy right but my student

several students come to me and say let's not go.

Last class you told us that we should be super excited about writing our first line of code.

And if you ever programmed before or if you ever Google something about programming chances are that

that is going to be something similar to what your first line of code.

But everyone tells it what it is.

Right.

So that is a high level language.

Yes.

You go and you compile your code your run and you'll see displayed Hello world on the screen and that

is Oh very nice.

I think we understand the appeal of using a high level language for testing things conditionals if Alice

loops functions Lane Domino program the higher level way like handling data that is all fine we understand

the hope you of that but several students they come to me and they can't just a computer science they

came to study understanding the ins and out right they say right Gustavo I understand but I want more.

There is something that is missing right.

I'm just saying print Hello World.

I have been printing hello world since I was a kid working with words star or Microsoft Word.

I want to understand there is this great box in front of me that has a processor that has these memory

because I know that because the guy RadioShack told me that there is this memory that I should spend

more money with.

How did this thieves communicate to each other.

What is going on under the hood.

When I say print Hello world what is going on under the hood in the memory in the processor that kind

of goes and displays h e l l o world I understand.

I wasn't very satisfied when I kind of just wrote this.

There is more.

That's that is my motivation as an educator as a processor to come and create a company like this one

and I know that as a student as someone that just enroll for this course you probably leave in this

kind of investigative approach right you are curious by nature and this is why I'm tackling this.

If I'm making you sweat in the next couple of hours don't worry.

Stick around I promise you by the end of this course you will learn quite a bit about computer architecture.

The low level programming as to say some but I just want to give you a bird's eye view of the plan that
___

### Content of the Course
* Atari 2600 Hardware & Specs
* The 6502/6507 Processor
* Working with Digital Values (bin/hex)
* Using an Atari Emulator
* Assembling your own ROM cartridges
* The basics of 6502 Assembly Language
* Video, Audio and Input adapters
* Code examples and techniques
___

### Other Points
* Assembly 6502 is closer to Human Programmin Languages (It was created for the Game Developers of Atari!) than Assembly x86 which nowadays is available.
___

# 2. Hardware and Architecture

## 2.1. Hardware and Specs
* The very first gaming devices (ca. 1972) had only one games and if you wanted a new game you should have bought a new device!

* The most old video games PONG, TANK had some common elements (Remember about these elements we will talk about them later and the communication between devices for them):
    * Player 1
    * Player 2
    * Scoreboard
    * Ball / Missile
    * Playing Field
    * Collision / Bouncing

![very first games](./images/the-very-first-games.png)

* In 1975, Atari decided to release a console based on programmable design

* Code name of project was Stella

* 3 Processors were considered (candidated) for the Atari 2600:
    * Intel 8080
    
    * Motorola 6800
    
    * __MOS 6502__ (bought by Commodor before release) - The winner!
        * A lot cheaper (15$) than Intel8080 and Motorola6800 (around 120$)!

### ATARI 2600
![Picture of Atari 2600](./images/atari-2600.png)

* CPU : 1.19 MHz 6507

* Audio/Video : TIA Chip (Television Interface Adapter)

* RAM : 128 bytes 6532 RIOT (Read Input Output Timer) Chip

* ROM (game cartridges) : 4kB (So we have 4kB for writing our code in this course!)

* Input : Two controller ports (joystick, paddle, etc)

* Output: TV via RCA Connector : There were 3 Standards available (NTSC, PAL, SECAM). NTSC for America and the PAL is the european version

### Timeline of Atari 2600
* 1977 - 2600 "HEAVY SIXER" 
![Heavy Sixer](./images/2600-heavy-sixer.png)

* 1978 - 2600 "LIGHT SIXER"
![Light Sixer](./images/2600-light-sixer.png)

* 1980 - 2600-A "FOUR-SWITCH"
![Four Switch](./images/2600-four-switch.png)

* 1981 - 2600 "DARTH VADER"
![Darth Vader](./images/darth-vader.png)

* 1986 - 2600 JR
![2600 jr](./images/2600-jr.png)

### Board
![Board](./images/board.png)

![Board Map](./images/board-map.png)

![Board Schema](./images/board-schema.png)

### Processor
* The __6502__ powered ...
    * Apple lle
    * Commodore PET
    * BBC Micro
    * Commodore VIC-20
    * Commodore 64
    * Tamagotchi
    * Atari 2600
    * Bender Rodrigues

![6502 pinout](./images/6502-pinout.png)

### 6507 Processor
* 6507 is essentially a 6502 in a cheaper 28-pin package.
* A15 to A13 and other interruption lines are not accessible (to make it cheaper)

### TIA PAL and NTSC
![TIA Boards](./images/TIA.png)
___

## 2.2. Review of Binary and Hexadecimal
### Human and Decimals
We humans use the decimal system, that means we use 10 digits to represent the numbers (0 to 9), for example the Number 12 means that we have 1 x 10^1 and 2 x 10^0 or 348 means we have 3 x 10^2 , 4 x 10^1 and 8 x 10^0

_SO WE HUMANS COUNT IN "BASE OF 10"!_

### Computers Count in Base 2
Just like our way but computers does not have 0 to 9 digits to represent numbers! they have only 0 and 1 to present numbers! So for example 11 (in Base 2) means we have 1 x 2^1 and 1 x 2^0 which is in our Decimal System (Human system) 3.  
Or for example 1011 in Base 2 is 11 in Base 10.

In a binary number the most right number is called __LSB__ (Least Significant Bit) and the most left one is called __MSB__ (Most Significant Bit)

### Other Bases & Hexadecimal
There is also several other bases like Base-12 and sometimes programmes use Base-8 , but one of the most important bases for programmers is __Base-16__

In __Base-16__ again we use 0-9 to represent the first 10 numbers and then for the next 6 Numbers 11th (10 in our system) to 15th (16 in our system) we use A-F.

So for example 12 in Base16 means 1 x 16^1 + 1 x 16^0 = 17 (in Base 10 , our system).

### Convert from Binary (base2) to Hexadecimal (base16):
00011011 (27 in base10) , imagine this binary number we do the following steps to convert this to a hexadecimal:

1. separate these number with 4 digits : 0001 1011

2. Convert these two groups to Decimal number:
    * 0001 is 1 (base10)
    * 1011 is 11 (base10)

3. Convert from decimal to hexadecimal:
    * 1 is 1 (base16)
    * 11 is B (base16)

4. So the 00011011 is __1B__ (base16) , 1 x 16^1 + B x 16^0 = 27 (base10)

### Hexadecimal in Memory
![hexadecimals](./images/hexadecimal.png)

One of the advantages of using hexadecimals is that we can represent a larger number in a shorter representation bzw. less digits. (for example "ee" is 15 x 16^1 + 15 x 16^0 = 255 (base10))

### Conventions in this course
* ``#2`` : The Hash tag, this means the literal 2, also in Base10 (decimals)

* ``$2F`` : This dollar sign we use for hexadecimals (base16) , 2F is btw #47

* ``%00101100`` : And we are going to use % sign to represent binaries and their bits.
___

## 2.3. The 6502 Processor
### 2.3.1. 6507
* The 6507 uses a 28-pins configuration

* 13 Address pins and 8 data pins

* The remaining pins are used for:
    * Power

    * CPU timing clock
    
    * CPU reset
    
    * Request Bus Wait state (the RDY Pin)  
        the RDY pin the R2 IPO or the ready pin. It helps us with synchronization of tasks. So whenever for example we need to send instructions through the television set via the TIA chip the RDY chip is stimulated back whenever the TIA says _"OK I'm done rendering things with electrons, You can resume."_ So now we can resume the processing then we send the ready signal back to the processor and the process resumes its calculations and the next test that we had to perform.
    
    * Read/Write command to Memory from CPU

* There is no IRQ (Interruption Request) or NMI on the 6507 processor. (Because of manufacturing costs)

![6507](./images/6507.png)
___

### 2.3.2. CPU & Bus
![CPU & Bus](./images/cpu-and-bus.png)

Let's talk about the CPU and let's look at the internals of the CPU and also talk about the BUS Lanes that we have. 

CPU TAKES 1.19 million times per second. We call each one of these TAKES a ``CLOCK CYCLE`` CPU Cycle. You have to remember that the way the processor works is we almost have this kind of electronic spring that unwinds and we turn tiny gears inside our processor, every performance, every computation that we calculate, we go and we store the values inside these tiny gears and then we rest each tick (clock cycle) we perform and we rest it in a different state and different tick we perform we execute tasks and then we rest in a different state again.

This is a quick diagram like a high level view of these internals and let's go through each one of them.

#### ALU
In 6502 or 6507 contain 7 main parts, one of the important parts is the ``ALU`` (highlighted in green here).

You can see that the ALU is what we call the ARITHMETIC LOGIC UNIT.

This is what is responsible for adding binary numbers together, performing the actual arithmetic calculations. But not only arithmetic, also comparing values as well as you see logical comparison.
___

#### Registers
#### Accumulator Register
Besides the ALU we also have six ``addressable registers`` (highlighted in yellow here).

The ALU doesn't work alone. It uses what we call the ``Accumulator register`` also known as the ``A-register`` and you can see that I decided to represent the ALU here as this kind of V-shaped. Because we do have these two input things.

One of the inputs comes from the ``Accumulator Register`` the other input comes from the ``Data Bus`` as you see. And then after a calculation we get the result which actually we feedback to the ``Accumulator Register``

and you'll see that when we program and that's exactly what happens right we used in a loop and it's kind of transparent for us. We just say ``add accumulator`` and feedback to our ``A(Accumulator)-register`` 
___

#### X and Y Registers
Under registers there are important registers, the ``Y register`` and the ``X register``. They are kind of help us keep track of other variables and order values in our programs things such as like counter to count if we are in the loop as well if you want a control loop ending and such things, X and Y there's kind of this generic register that we can use for this.

#### Other Registers ( P , SP , PC )
The other registers that we have is what we call the ``P Register`` for the processor status and we will zoom in and look a little bit better into the next topic we look about the processor.

We have also ``SP Register`` and ``PC Register``.

Different than all the other registered there are 8-bits the ``SP Register`` and ``PC Register`` are 16-bits. 

#### SP Register (Stack Pointer)
SP stands for ``Stack pointer`` and PC or ``Program Counter``.

We have to think of the ``Stack Pointer`` as it holds the address, you see that it comes from the ``Address Bus`` and also holds the address.

That's why it is 16-bits because the address is 16-bits in our Atari.

So the ``Stack Pointer`` holds the address of the Pointer in our ``Hardware Stack``.

We have a place in ``memory`` called the ``hardware stack`` where we keep control of temporary data storage: Function calls and etc. 

![Stack](./images/stack.png)

So this basically is pointing as we grow the stack and as we add things through the stack is pointing always to the top element and as we grow or shrink the ``Stack Pointer`` always holds the Address Position of that top element of the stack

#### PC Register (Program Counter)
The ``Program Counter Register`` is also 16 bits because it holds a memory address of the next things instruction that a processor needs to execute. 

![Program Counter](./images/pc-register.png)

Remember that a ``Processor`` basically all it does is __FETCHES__ information, __PARSES__ that information and __EXECUTES__ it.

So how does it know what is the next instruction that you need to execute after we finish the last one? we have for that the ``Program Counter Register`` which holds the address of the next line you need to perform.

#### Data Bus & Address Bus
We also have the ``Data Bus``, so the Data Bus is where we move the bits from register to register, from inside a processor and also from ``registers`` to ``memory`` 

And we have the ``Address Bus`` which is kind of holds information of WHERE the things are in ``memory``. So the addresses of the values that we need there'd be one to kind of process. 

``Data Bus`` keeps track of the data and MOVE the data between the ``Registers`` and ``Memory``. And ``Address Bus`` keeps track of the memory addresses that we are talking about.
___

![Data Bus & Address Bus](./images/data-bus-and-address-bus.png)

Again quick details of the bus. Remember 8-bit for the ``Data Bus`` and 16-bits for the Address Bus response communicating between the processor and also memory and other parts. 

you see that the ``Data Bus`` on the left. ``Data Bus`` tells us WHAT, what are the values that we are manipulating. And the ``Address Bus`` holds the WHERE, where are the Addresses of the values that we are we are fetching, sending information to, or receiving information and reading from.
___

![Registers in Details](./images/registers-in-details.png)

We have the Accumulator, X, Y, they are all __8-bits__ you can see the length of those of those registers but the ``stack pointer`` and the ``program counter`` are both __16-bits__.

(The ``Stack Pointer`` has teh first half of the bits fixed with the values ``$01``, and only the second half changes to point to the correct address in the ``Memory Stack``)

#### Processor Status Register (``P Register``)
Let's quickly talk about ``the processor state register``. P register is a special eight bit register where each one of the bits is like a little flag that will tells us that's what that's something happen with the processor examples : 

* __``c`` (Carry)__ :  
you can see here the rightmost bit, the c one is what we call  ``CARRY FLAG`` and we will see that whenever we add two values together, if we had two binary values together there is a chance that we kind of ``Overflow`` and kind of we exceed the number of bytes that we have the number of bits that we have and then we have a little carry is almost like adding things right when you add things manually you had to carry the number whenever that computation in the ``ALU`` happens, this ``Register Flag`` is set to 1.

* __``z`` (Zero)__ :  
We also have ``ZERO RESULT FLAG``.  
So if the last computation the last processing meant that the the processor computed resulted in a zero value. This flag is set that helps us do understand how this can help us create even conditional tests. For example _if zero then do something not do something else_. So linking to it like a high level language idea of a conditional we can use this little flags to test and perform different tasks accordingly we also have going on here 

* __``i`` (IRQ Disable)__:  
we also have the ``i-flag`` which is the IRQ Disable, to disable we have the decimal mode. We're going to talk we're going to kind of have a special deal when we are programming and discuss why these things are important. 

* __``d`` (Decimal Mode)__:  
We have the decimal mode. The Decimal Mode is a little bit funny because you know that normally the Processor work with binary numbers right. We add ones and zeros to get or we perform arithmetic but the tricky thing is whenever you're performing these tasks binary it's not always 100 percent accurate. So the processor the 6502 has something called the ``decimal mode`` which kind of works is the processor to working in decimal binary coded decimal mode or BCD we're going to talk about this later as well.

    The idea is it's a little bit slower than normal binary arithmetic but it will always be accurate when example of the things that actually use BCD (Binary Code in Decimal) mode is the basic interpreter of the Atari.

    ![Binary Code Decimal Mode in Atari](./images/atari-BCD-mode.png)

    It is a little bit slower than normal but that is why the basic interpreter of the Atari behaves a little bit slower, because it uses the BCD mode, binary code in decimal 

* __``b`` (Break Instruction)__:  
We have the break break instructions, sometimes as programmers we can force some break instructions for debugging processes so we stop the execution to see the values of things 

* the fifth bit from right to left it's unused. So you see there is empty. There is no flag there. So that is unused 

* __``v`` (Overflow)__:  
the V flag is called the overflow. It's different than ``c (Carry)`` and we're going to see in the next slide why so the Overflow tells us if by any chance we try to add two things or subtract and we overflow and went from positive to negative numbers.

* __``n`` (Negative)__:  
and the N flag tells us if the less computation performed resulted in a negative value.
___
___

## 2.4. ``P-Register`` : Carry and Overflow Flags & Negative Numbers
OK so we just spoke about the ``Carry`` flags and ``Overflow`` flags on our key register of the processor.

I want you kind of zooming in discussing it to be more how we handle the ``Carry`` elements and also negative numbers in the Processor.
___

![P Register In Details](./images/p-register-1.png)

Whenever we look again at the ``P. register``. Remember the ``P register`` is the one that calls that towards the Processor Status thing.

So he has eight bits holding things as the: 
* ``Carry`` flag the 
* ``Zero`` flag, 
* ``Interruption Request Disabled`` flag, 
* ``Decimal Mode`` flag active or not, 
* ``Break Commands`` flag ,
* We have this unused one which is the fifth bit,
* the ``Overflow`` flag,
* and the ``Negative`` flag.

So we are speaking about identifying certain status from the processor. But I think it's important to understand really what ``Carry`` is and what ``Overflow`` is. And that kind of links to the idea of understanding how we store negative numbers in computer.

### Carry Flag

![Carry Flag](./images/carry-flag.png)

Let's talk about the ``Carry`` flag. Remember that we spoke about binary numbers.  
So whenever we have the ``ALU`` you processing things most of the time you're going to say: _"ALU processor add two numbers together!"_.  

And as we can see we have this FF (base16) = 1 1 1 1 1 1 1 1. And I'm adding FF with 01 I'm adding these two numbers together. What happens when we actually add these numbers together. Well first of all let's add one and one that will give me two. But two in binaries 10_(base2). We uses more than one bit. So we have to write down the zero and then carry the one up so one plus one is two that means zero and then we carry that one up.

So now we have to add again one plus one that will give us again 2 (10_(binary)) and then we write to zero any CARRY again to one there and never repeat one plus one to carry the one one plus one plus one two one zero carry the one one plus one one zero character to one one plus one zero card the one one one plus one two, carry the one.

So you see now that we had reached the limit of the eight bits we're going to have a problem. We're basically going to have to carry that one there and then we have this one extra to the bit. So this is specifically why we have the processor flag called the carry flag whenever that happens whenever I extrapolate extrapolate the limits of my eight meetings and my computation actually uses that one at the end the processor flag carry will be set to one I think it's telling us a little CARRY HAPPENED. You have to if you need to take care of this handle right you have to go and find your own way of handling this later. The only thing the processors tell this in the flag is a carry happened.
___
### Negative Numbers 
#### Sign & Magnitude - Approach-1

![Sign & Magnitude](./images/sign-and-magnitude-method.png)

We want to talk about is how do numbers how the computer is represent negative numbers.  

We learned how to represent numbers from zero to 256. With the 8-bits. So these things represent different positive integer numbers.

But we know that computers also can represent negative numbers. How do we do that?  
We start the idea of thinking that a number can only be positive or negative. They're just these only two states meaning that they can only be positive or negative or negative.

We only need one bit to identify if that number is positive or negative to identify the sign of the number. What people started doing is they use the leftmost bit the leftmost bit tells us what is the sign of the number. Whenever we have a zero on the left most beat that it usually tells us that is a positive number and when __the most lef number is 1__ that means we have a negative number.

So as you can see the leftmost beat sort of called the ``Sign Bit``. It tells us ``0`` --> that number is positive, ``1`` --> That number is negative. 

That has some that creates some repercussions right on our number and magnitude that we can store. That means that instead of supporting for example for 8 bits (a byte), 256 positive number, So it's half. 

Now we store the first, we have to take out because it represents the sign and so we have only 7 bits to represent ``-127`` to ``127`` so we remove one of the bits, we lose half of the potential that we had to store the magnitude. 

This very simple method is called ``SIGN & MAGNITUDE`` but it has some problems. It was kind of too good to be to be real right. It has some issues. One of the issues that we have is one if you probably kind of already noted that THERE ARE TWO WAYS OF REPRESENTING 0!

I can have ``0000 0000`` so the +0 , and ``1000 0000`` meaning -0 !!! So that is a deal breaker for us. And also arithmetic thinking this in this case it becomes cumbersome. But basically this is a deal breaker for us. We need a smarter way of thinking about it. Virtually no computer use the ``Sign & Magnitude`` anymore.
___

#### Two's Complement

![Two's Complement Explained](./images/twos-complement-explained.png)

So what we do is we come up we came up with a smarter way of representing negative numbers. What we use is what we call Two's Complement. And this is kind of the most popular way that computers store negative numbers today. And also this is the way that the Atari processor stores and handles negative numbers. what we do is remember how we have the binary numbers like a normal binary. We have these columns where represents 2 to the 0 2 to the one true to the two cubed 2 to the fourth. So we have ones twos force eight takes things thirty two sixty four and 128. This was the normal kind of vanilla way that we thought our or our normal binaries or sometimes called ``Unsigned (Normal) Binary`` right.

But in ``Two's Complement`` whenever we need to represent a Signed (negativ) number, what we do is the left most column represents how many negative 128 we have in our number. And all the subscript but it actually works because if you store in the left one how many -128 to have.

That is the maximum number of negative values that you can have and everything you have on the right like +64, +32, +16, you basically ADD to the -128 and if by any chance you do not want a negative number. All you have to do is to put the leftmost bit to 0 and you then have 127 positive values to represent. 

So the leftmost column there tells us how many -128 we have that number that we're representing. Two'S Complement is the most popular way and the most popular method to represent negative numbers by computers today and by the Atari as well. 

There is only ONE WAY of representing zero (the Problem of the ``Sign & Magnitude`` solved!) if you agree with me. Zero is only represented by ``0000 0000``.

And also if we look at the arithmetic way with two's Complement simpler it may just kind of just works out of the box, if you add two numbers the result is most most likely correct or what we have to do with 
___

![Two's Complement Examples](./images/twos-complement-examples.png)

I just want to show again a couple of examples. 

The First Example here would be +127, because I add all the bits until all the bits are active and then I have zero for my -128. So all those bits added together will give me 127 or ``7F`` in hexadecimal code. 


The Second Example is -128 because I activate my leftmost column saying that I have one -128 and then everything else is zero. So this is the the lower part of the range that I can represent right. - 128.


The Third Example. What if I have all 1s. Well in this case I say I have full -128. But I also have +64 , +32 , +16 , +8 , +4 , +2 and +1 so I would get minus one. So this is kind of a smart way of identifying and representing it is logical two's complement 

### Two's Complement Overflow
And we have a situation where we can have what we call an ``Overflow``. This would a process recall an ``Overflow`` in the sine bit again the same situation.

![Stack Overflow!!!](./images/stack-overflow-understood.png)

Let's say that I'm adding Well 0 1 1 1 1 1 1 1 plus 1 these two numbers together the same thing will happen. We have one plus one that will get us to 2 is 10. So we write the zero on the right and we CARRY the one to the next bit one plus one will give us two again. Right ``Carry`` 1 one plus one to again carry 1 one plus 1 again carry one one plus one to carry one one plus one to carry one. 

And then on that specific LAST one plus one will be two, carry one and on the left bit on the left most beat is one point plus 0 one we do not have to carry anything we are still working with only 8 bits we didn't have to kind of carry on to the next to the next it is still a normal byte, normal calculation it looks OK. 

We didn't have to carry any bit extra everything looks OK but if we're talking about to complement we have a bug because this means that +127 (decimal) plus 1 (decimal) will give us what, remember to call them that we haven't left is -128, that gave us minus 128. 

In this case whenever this happens whenever we change the status of the leftmost bit from zero to one and vice versa the processor will set what we called the ``Overflow flag`` so we if we are ever programming or games or programming or applications and we're adding two numbers right we have two sprites on the screen with the players and the positions like we had we added the two positions and it becomes from 2 positive to a negative we can check the processor status flag for ``Overflow`` and we will be set and then we can take the action that we need to take and kind of work around.

So this is basically why I wanted to tell you how negative numbers worked because these two flags the ``carry`` flag and the ``overflow`` flag will be important for us to identify issues that might happen whenever we're talking about the arithmetic of the numbers. So by looking at the processor status flag we can kind of take action and go from there.
___
___
___

# 3. 6502 Assembly Programming

## 3.1. The Assembler Flow
https://www.udemy.com/course/programming-games-for-the-atari-2600/learn/lecture/13486008#content

![Assembler](./images/assembler01.png)

* Assembler is something like a Compiler , it translates for example ``LDA #2`` (Load 2 (base10) into the Register A) into the MACHINE CODE: 1010 1001 0000 0010  (``A9 02``)

* MOS 6502 is a ``little endian`` processor (it first store the small part and then big parte)

![Assembler02](./images/assembler02.png)

___

## 3.2. Assembly Language(s)?
## 3.3. Popular 6502 Assembly Instructions
## 3.4. Installation and Tools
## 3.5. Picking a Code Editor
## 3.6. Our First Assembly Code
## 3.7. The DASM Assembler
## 3.8. The Stella Emulator
## 3.9. Installing DASM on Windows
## 3.10. The Javatari Emulator
## 3.11. Our First Assembly Bug