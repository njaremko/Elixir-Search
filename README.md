# Search

This is a multi-threaded file search that behaves similarly to unix's ```find``` command

Currently only supports --name (explicit with no wildcard or expressions) and selecting directory on run.

## Example Usage

```./search . --name file.txt```
or
```./search ./temp --name file.txt```

## Installation

Not avalible on hex because it's not faster than regular unix ```find```
I don't image it will ever be as fast, but the current speed isn't too bad.
