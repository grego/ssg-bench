+++
title = "Mu"
date = 2020-09-18
image = "img/mu.jpg"
description = """A monk asked Joshu, "Has the dog the Buddha nature?" """

[taxonomies]
categories = ["kōans"]
tags = ["pets"]
authors = ["Mumon"]
+++
A monk asked Joshu, "Has the dog the Buddha nature?"
Joshu replied, "Mu"
<!-- more -->

```rust
use std::io::{stdout, Result, Write};
fn main() -> Result<()> {
    let (s, e) = (br#"use std::io::{stdout, Result, Write};
fn main() -> Result<()> {
    let (s, e) = (br#""#, br#"#);
    let start = s.iter().chain(s).chain(&[b'"',b'#']).chain(b", br#\"");
    let end = e.iter().chain(b"\"").chain(e).chain(b"\n");
    stdout().write_all(&start.chain(end).copied().collect::<Vec<_>>())
}"#);
    let start = s.iter().chain(s).chain(&[b'"',b'#']).chain(b", br#\"");
    let end = e.iter().chain(b"\"").chain(e).chain(b"\n");
    stdout().write_all(&start.chain(end).copied().collect::<Vec<_>>())
}
```

### Mumon's Comment:
> For the pursuit of Zen, you must pass through the barriers (gates) set up by the Zen masters. To attain his mysterious awareness one must completely uproot all the normal workings of one's mind. If you do not pass through the barriers, nor uproot the normal workings of your mind, whatever you do and whatever you think is a tangle of ghost. Now what are the barriers? This one word "Mu" is the sole barrier. This is why it is called the Gateless Gate of Zen. The one who passes through this barrier shall meet with Joshu face to face and also see with the same eyes, hear with the same ears and walk together in the long train of the patriarchs. Wouldn't that be pleasant?  
> Would you like to pass through this barrier? Then concentrate your whole body, with its 360 bones and joints, and 84,000 hair follicles, into this question of what "Mu" is; day and night, without ceasing, hold it before you. It is neither nothingness, nor its relative "not" of "is" and "is not." It must be like gulping a hot iron ball that you can neither swallow nor spit out.
