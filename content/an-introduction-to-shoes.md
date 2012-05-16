---
title: "An Introduction to Shoes"
slug: "an-introduction-to-shoes"
blurb: "Learn about the Shoes GUI toolkit."
categories:
  - shoes
  - beginner
---

## Hello there!

### Let's get started

Welcome to your first lesson about Shoes! I'm going to introduce you to the
basics that Shoes brings to everyone who programs.

If you didn't know, Shoes is a Ruby toolkit that lets you build GUI programs
really easy and fun!

## Apps

### Shoes.app

Okay! Shoes is tons of fun. It's really easy to get started. Here's the simplest
Shoes app ever:

    Shoes.app do
    end

Give that a spin!

### It's just a block

You didn't say that you wanted anything in the app, so it just gives you a blank
window. You can pass options in, too: 

    Shoes.app :height => 200, :width => 200 do
    end

This'll give you whatever sized app you want! We'll be putting all of the fun
stuff inside of the `do...end`.

## para

### The basics

Blank windows are pretty boring, so let's spice it up with some text!

    Shoes.app do
      para "Hello, world"
    end

You know what to do by now. `para` is short for 'paragraph.' It lets you place
text in your apps.

`para` and other Shoes widgets take bunches of options, too. Check it:

    Shoes.app do
      para "Hello there, world", :font => "TakaoGothic"
    end

## flows

### They're default!

If you're looking to lay out your Shoes widgets, there are two options. The
first is a `flow`. A Flow is the default layout a Shoes app has. So this won't
look much different from one without the flow:

    Shoes.app do
      flow do
        para "Hello!"
        para "Hello!"
        para "Hello!"
      end
    end

As you can see, the `para`s are lined up in a row. By itself, kinda
boring, since they already do this. But...

## stacks

### The counterpart of flows

`stack`s are kind of like flows, but they go up and down rather than sideways.
Try this as an example:

    Shoes.app do
      stack do
        para "Hello!"
        para "Hello!"
        para "Hello!"
      end
    end

Just a little bit different, eh?

## stacks + flows

### With their powers combined...

You can combine the `stack` with the `flow`s to make whatever kind of layout you
want. For example: 

    Shoes.app do
     flow do
        stack :width => 50 do
          para "Hello!"
          para "Hello!"
          para "Hello!"
        end
        stack :width => 50 do
          para "Goodbye!"
          para "Goodbye!"
          para "Goodbye!"
        end
      end
    end

The `:width` attribute sets how wide the stack is. Pretty simple.

## button

### Push it real good

Buttons are also super simple in Shoes. Just give them a title and a bunch of
code to run when they get pushed:

    Shoes.app do
      button "Push me" do
        alert "Good job."
      end
    end

I bet you're starting to see a pattern. Shoes loves to use blocks of code to
make things super simple.

## image

### Pics or it didn't happen

There are two ways that you can show an image in a Shoes app. Either you have
the file on your computer:

    Shoes.app do
      image "#{HH::STATIC}/matz.jpg"
    end

(This particular example only works if you're in Hackety Hack, by the way!
Can you figure out what this does? Don't feel bad if you can't.)

Or you can also specify an image on the web:

    Shoes.app do
      image "http://shoesrb.com/images/shoes-icon.png"
    end

Either one is fine. Shoes cares not.

## edit_line

### Getting some input

If you'd like to let someone type something in a box, well, `edit_line` is right
up your alley!

    Shoes.app do
      edit_line
    end

This is sort of boring though... why not get the information from the box?

    Shoes.app do
      line = edit_line
      button "Push me!" do
        alert line.text
      end
    end

## Summary

### Great job!

There's a ton more things that you can do with Shoes, but you've got the basics
down!

If you'd like to learn more, you can visit the [Shoes
website](http://shoesrb.com/) or press Control-M (or Command-M) to bring up the
Shoes Manual.
