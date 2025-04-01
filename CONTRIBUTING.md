# Contributing

Feel free to submit a PR to add rules but please take note of the style that rules are written & files are
made, then follow that style.

## Testing

1. Write Rego unit tests.
2. Run: `conftest verify`.

## Working with Rego

Rego is weird and takes a little bit of getting used to.

It's a declarative language inspired by Datalog so it has all the quirks of that.

In the case of these rules, it contains a bunch of `deny` rules, which can be difficult to work out what the
logic of the rules are, and if you need negatives in your rules, and what those negatives mean. Making truth
tables can be helpful here, but also... testing the rules against actual resources is helpful.

When fields are undefined but you need to check them, the way to write those rules is... unintuitive.

Here's some helpful tips to working with Rego:

TODO: Write tips (lol).
