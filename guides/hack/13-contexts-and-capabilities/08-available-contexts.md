**Note:** Context and capabilities are enabled by default since
[HHVM 4.93](https://hhvm.com/blog/2021/01/19/hhvm-4.93.html).

# Available Contexts
A Context is a collection of [Capabilities](/hack/contexts-and-capabilities/available-capabilities).

A function can implement contexts, capabilities, or both. When a function implements many contexts, the function receives a *context list*.

## The `defaults` context
Represents the capability set {IO, WriteProperty, AccessGlobals}.

```hack
function f()[defaults]: void {}
```

A function with no specified context list is functionally equivalent to defining a function that implements only the `defaults` context.

```hack
function f(): void {} // equivalent to `function f()[defaults]: void {}`
```

## `The write_props` context
Represents the capability set {WriteProperty}.

```hack
function f()[write_props]: void {}
```

## The `globals` context
Represents the capability set {AccessGlobals}.

```hack
function f()[globals]: void {}
```

## The `[]` context 
The empty context list, `[]`, has no capabilities.

```hack
function f()[]: void {}
```

Because of its similarity to pure functions in other languages, the empty context list is also referred to as the 'pure context'.

**Not including a context list is different from specifying an empty context list.** An empty context list has no capabilities; 
a function with no specified context list is functionally equivalent to defining a function that implements only the `defaults` context.

