# Rust API Guidelines Checklist

<!-- Read CONTRIBUTING.md before writing new guidelines -->

- **Organization** *(crate is structured in an intelligible way)*
  - [ ] Crate root re-exports common functionality ([C-REEXPORT])
  - [ ] Modules provide a sensible API hierarchy ([C-HIERARCHY])
- **Naming** *(crate aligns with Rust naming conventions)*
  - [ ] Casing conforms to RFC 430 ([C-CASE])
  - [ ] Ad-hoc conversions follow `as_`, `to_`, `into_` conventions ([C-CONV])
  - [ ] Methods on collections that produce iterators follow `iter`, `iter_mut`, `into_iter` ([C-ITER])
  - [ ] Iterator type names match the methods that produce them ([C-ITER-TY])
  - [ ] Ownership suffixes use `_mut` and `_ref` ([C-OWN-SUFFIX])
  - [ ] Single-element containers implement appropriate getters ([C-GETTERS])
  - [ ] Feature names are free of placeholder words ([C-FEATURE])
- **Interoperability** *(crate interacts nicely with other library functionality)*
  - [ ] Types eagerly implement common traits ([C-COMMON-TRAITS])
    - `Copy`, `Clone`, `Eq`, `PartialEq`, `Ord`, `PartialOrd`, `Hash`, `Debug`,
      `Display`, `Default`
  - [ ] Conversions use the standard traits `From`, `AsRef`, `AsMut` ([C-CONV-TRAITS])
  - [ ] Collections implement `FromIterator` and `Extend` ([C-COLLECT])
  - [ ] Data structures implement Serde's `Serialize`, `Deserialize` ([C-SERDE])
  - [ ] Crate has a `"serde"` cfg option that enables Serde ([C-SERDE-CFG])
  - [ ] Types are `Send` and `Sync` where possible ([C-SEND-SYNC])
  - [ ] Error types are `Send` and `Sync` ([C-SEND-SYNC-ERR])
  - [ ] Error types are meaningful, not `()` ([C-MEANINGFUL-ERR])
  - [ ] Binary number types provide `Hex`, `Octal`, `Binary` formatting ([C-NUM-FMT])
- **Macros** *(crate presents well-behaved macros)*
  - [ ] Input syntax is evocative of the output ([C-EVOCATIVE])
  - [ ] Macros compose well with attributes ([C-MACRO-ATTR])
  - [ ] Item macros work anywhere that items are allowed ([C-ANYWHERE])
  - [ ] Item macros support visibility specifiers ([C-MACRO-VIS])
  - [ ] Type fragments are flexible ([C-MACRO-TY])
- **Documentation** *(crate is abundantly documented)*
  - [ ] Crate level docs are thorough and include examples ([C-CRATE-DOC])
  - [ ] All items have a rustdoc example ([C-EXAMPLE])
  - [ ] Examples use `?`, not `try!`, not `unwrap` ([C-QUESTION-MARK])
  - [ ] Function docs include error conditions in "Errors" section ([C-ERROR-DOC])
  - [ ] Function docs include panic conditions in "Panics" section ([C-PANIC-DOC])
  - [ ] Prose contains hyperlinks to relevant things ([C-LINK])
  - [ ] Cargo.toml includes all common metadata ([C-METADATA])
    - authors, description, license, homepage, documentation, repository,
      readme, keywords, categories
  - [ ] Cargo.toml documentation key points to "https://docs.rs/CRATE" ([C-DOCS-RS])
  - [ ] Crate sets html_root_url attribute "https://docs.rs/CRATE/VER.SI.ON" ([C-HTML-ROOT])
  - [ ] Release notes document all significant changes ([C-RELNOTES])
- **Predictability** *(crate enables legible code that acts how it looks)*
  - [ ] Smart pointers do not add inherent methods ([C-SMART-PTR])
  - [ ] Conversions live on the most specific type involved ([C-CONV-SPECIFIC])
  - [ ] Functions with a clear receiver are methods ([C-METHOD])
  - [ ] Functions do not take out-parameters ([C-NO-OUT])
  - [ ] Operator overloads are unsurprising ([C-OVERLOAD])
  - [ ] Only smart pointers implement `Deref` and `DerefMut` ([C-DEREF])
  - [ ] `Deref` and `DerefMut` never fail ([C-DEREF-FAIL])
  - [ ] Constructors are static, inherent methods ([C-CTOR])
- **Flexibility** *(crate supports diverse real-world use cases)*
  - [ ] Functions expose intermediate results to avoid duplicate work ([C-INTERMEDIATE])
  - [ ] Caller decides where to copy and place data ([C-CALLER-CONTROL])
  - [ ] Functions minimize assumptions about parameters by using generics ([C-GENERIC])
  - [ ] Traits are object-safe if they may be useful as a trait object ([C-OBJECT])
- **Type safety** *(crate leverages the type system effectively)*
  - [ ] Newtypes provide static distinctions ([C-NEWTYPE])
  - [ ] Arguments convey meaning through types, not `bool` or `Option` ([C-CUSTOM-TYPE])
  - [ ] Types for a set of flags are `bitflags`, not enums ([C-BITFLAG])
  - [ ] Builders enable construction of complex values ([C-BUILDER])
- **Dependability** *(crate is unlikely to do the wrong thing)*
  - [ ] Functions validate their arguments ([C-VALIDATE])
  - [ ] Destructors never fail ([C-DTOR-FAIL])
  - [ ] Destructors that may block have alternatives ([C-DTOR-BLOCK])
- **Debuggability** *(crate is conducive to easy debugging)*
  - [ ] All public types implement `Debug` ([C-DEBUG])
  - [ ] `Debug` representation is never empty ([C-DEBUG-NONEMPTY])
- **Future proofing** *(crate is free to improve without breaking users' code)*
  - [ ] Structs have private fields ([C-STRUCT-PRIVATE])
  - [ ] Newtypes encapsulate implementation details ([C-NEWTYPE-HIDE])
  - [ ] Data structures do not duplicate derived trait bounds ([C-STRUCT-BOUNDS])
- **Necessities** *(to whom they matter, they really matter)*
  - [ ] Public dependencies of a stable crate are stable ([C-STABLE])
  - [ ] Crate and its dependencies have a permissive license ([C-PERMISSIVE])


[C-REEXPORT]: organization.html#c-reexport
[C-HIERARCHY]: organization.html#c-hierarchy

[C-CASE]: naming.html#c-case
[C-CONV]: naming.html#c-naming
[C-ITER]: naming.html#c-iter
[C-ITER-TY]: naming.html#c-iter-ty
[C-OWN-SUFFIX]: naming.html#c-own-suffix
[C-GETTERS]: naming.html#c-getters
[C-FEATURE]: naming.html#c-feature

[C-COMMON-TRAITS]: interoperability.html#c-common-traits
[C-CONV-TRAITS]: interoperability.html#c-conv-traits
[C-COLLECT]: interoperability.html#c-collect
[C-SERDE]: interoperability.html#c-serde
[C-SERDE-CFG]: interoperability.html#c-serde-cfg
[C-SEND-SYNC]: interoperability.html#c-send-sync
[C-SEND-SYNC-ERR]: interoperability.html#c-send-sync-err
[C-MEANINGFUL-ERR]: interoperability.html#c-meaningful-err
[C-NUM-FMT]: interoperability.html#c-num-fmt

[C-EVOCATIVE]: macros.html#c-evocative
[C-MACRO-ATTR]: macros.html#c-macro-attr
[C-ANYWHERE]: macros.html#c-anywhere
[C-MACRO-VIS]: macros.html#c-macro-vis
[C-MACRO-TY]: macros.html#c-macro-ty

[C-CRATE-DOC]: documentation.html#c-crate-doc
[C-EXAMPLE]: documentation.html#c-example
[C-QUESTION-MARK]: documentation.html#c-question-mark
[C-ERROR-DOC]: documentation.html#c-error-doc
[C-PANIC-DOC]: documentation.html#c-panic-doc
[C-LINK]: documentation.html#c-link
[C-METADATA]: documentation.html#c-metadata
[C-DOCS-RS]: documentation.html#c-docs-rs
[C-HTML-ROOT]: documentation.html#c-html-root
[C-RELNOTES]: documentation.html#c-relnotes

[C-SMART-PTR]: predictability.html#c-smart-ptr
[C-CONV-SPECIFIC]: predictability.html#c-conv-specific
[C-METHOD]: predictability.html#c-method
[C-NO-OUT]: predictability.html#c-no-out
[C-OVERLOAD]: predictability.html#c-overload
[C-DEREF]: predictability.html#c-deref
[C-DEREF-FAIL]: predictability.html#c-deref-fail
[C-CTOR]: predictability.html#c-ctor

[C-INTERMEDIATE]: flexibility.html#c-intermediate
[C-CALLER-CONTROL]: flexibility.html#c-caller-control
[C-GENERIC]: flexibility.html#c-generic
[C-OBJECT]: flexibility.html#c-object

[C-NEWTYPE]: type-safety.html#c-newtype
[C-CUSTOM-TYPE]: type-safety.html#c-custom-type
[C-BITFLAG]: type-safety.html#c-bitflag
[C-BUILDER]: type-safety.html#c-builder

[C-VALIDATE]: dependability.html#c-validate
[C-DTOR-FAIL]: dependability.html#c-dtor-fail
[C-DTOR-BLOCK]: dependability.html#c-dtor-block

[C-DEBUG]: debuggability.html#c-debug
[C-DEBUG-NONEMPTY]: debuggability.html#c-debug-nonempty

[C-STRUCT-PRIVATE]: future-proofing.html#c-struct-private
[C-NEWTYPE-HIDE]: future-proofing.html#c-newtype-hide
[C-STRUCT-BOUNDS]: future-proofing.html#c-struct-bounds

[C-STABLE]: necessities.html#c-stable
[C-PERMISSIVE]: necessities.html#c-permissive
