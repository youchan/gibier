# Writing web application in Ruby
%author: Yoh Osaki a.k.a @youchan

%icon: ![](./data/images/youchan.jpg)

## Prologue

### Do you write web application with Rails?
#### or other framework in ruby?

### Does this happen to you?
You were developing web application with Ruby on Rails, but somehow you ended up writing front-end in JavaScript.

----
#### Front-end development is becoming important today

----
#### I love ruby, so I want to write front-end in Ruby too.

%ruby: ![](./data/images/ruby.png)

## Who am I?
* Yoh Osaki (@youchan)
* Rails Girl Tokyo 5th (Sep 2015) organizer
* Ubiregi inc.
* from Java to Ruby

### form Java to Ruby
#### ![java-to-ruby](./data/images/java_to_ruby.jpg)

### Ubiregi

%ubiregi-logo: ![](./data/images/ubiregi-logo.png)

* Junkudo had using Ubiregi
* iPad POS
* iPad app + API
* Ruby on Rails
* Dashboard: Web app

%ubiregi-ipad: ![](./data/images/ubiregi-ipad.png)

### Dashboard
* Web front-end
* Single page application
* Backbone.js => React.js

%space:

%dashboard: ![](./data/images/dashboard.png)

### React.js
* View framework using Virtual DOM
* JSX
* ReactNative - Same approach being applied to mobile apps.
* It's gettng lots of attention, but I, a rubyist, am feeling "left out in the cold".

## Hobby programming

## gohra
* Ooedo RubyKaigi 2015
* Card game rule engine
* Describe the geme rule in Ruby DSL
* Hobby programming
* Front-end => ?

----
#### I want to use what I love for my hobby programming.

## Hyalite

#### ![hyalite](./data/images/hyalite.jpg)

### Hyalite
* My first rubygem.
* Ruby
* Run in browser (Opal)
* React.js like Virtual DOM

## Opal

%opal: ![](./data/images/opal.png)

----
#### After using it for a while, my impression is "It works".

## The difference with MRI as a language.

### Symbol is String

```ruby
{ key: "value" }
```

* In this case, key is String in JavaScript.
* But Hash is different from Object in JavaScript...

### Kernel#proc
Kernel#proc cannot be called without block.

```ruby
def fun(*args, &block) # Argument of block type is not omissible.
  @proc = block
  # @proc = proc { yield }
end
```

## React.js

%react: ![](./data/images/react.png)

## Virtual DOM
Instead of directory manipulating the Real DOM, we work with Virtual DOM and save the diff to Real DOM.

----
#### ![virtual-dom](./data/images/virtual-dom.png)

## Hello React

```javascript
var HelloMessage = React.createClass({
  render: function() {
    return React.createElement("div", null, "Hello ", this.props.name);
  }
});

ReactDOM.render(React.createElement(HelloMessage, { name: "John" }), mountNode);
```

## Hello Hyalite

```ruby
class HelloMessage
  include Hyalite::Component

  def render
    Hyalite.create_element("div", nil, "Hello ", @props[:name])
  end
end

Hyalite.render(Hyalite.create_element(HelloMessage, { name: "John" }), mount_node)
```

### opal-browser

##### Browser API wrapper

%small: javascript

```javascript
document.getElementsByClassName('container');
```

%small: opal-browser

```ruby
$document['.container']
```

## JSX

### Hello JSX

```javascript
var HelloMessage = React.createClass({
  render: function() {
    return <div>Hello {this.props.name}</div>;
  }
});

ReactDOM.render(<HelloMessage name="John" />, mountNode);
```

### Short hand

```ruby
class HelloMessage
  include Hyalite::Component
  include Hyalite::Component::ShortHand

  def render
    div(nil, "Hello ", @props[:name])
  end
end

Hyalite.render(HelloMessage.el(name: "John"), mount_node)
```

## Example
* [TodoMVC](http://todomvc.com/)

----
#### [Hyalite TodoMVC](http://localhost:8000)

### This slide app

----
%small: config.ru

```ruby
require 'bundler'
Bundler.require

run Opal::Server.new { |s|
  s.append_path 'app'
  s.append_path 'node_modules'

  s.debug = true
  s.main = 'application'
  s.index_path = 'index.html.haml'
}
```

----
%small: application.rb

```ruby
module App
  def self.render
    Hyalite.render(
      Hyalite.create_element(TodoApp, {model: model}),
      $document['.todoapp'])
  end

  def self.model
    @model ||= TodoModel.new
  end
end
```
----
%small: application.rb

```ruby
class TodoApp
  include Hyalite::Component
  include Hyalite::Component::ShortHand

  def initial_state
    {
      nowShowing: :all,
      editing: nil,
      newTodo: ''
    }
  end
```

----
%small: application.rb

```ruby
require 'opal-router'

# ---- snip ----

  def component_did_mount
    router = Router.new
    router.route('/') { set_state(nowShowing: :all) }
    router.route('/active') { set_state(nowShowing: :active) }
    router.route('/completed') { set_state(nowShowing: :completed) }
  end
```

----
%small: application.rb

```ruby
  def render

# ---- snip ----

      header({className: 'header'},
        h1(nil, "todos"),
        input({
          className:'new-todo',
          placeholder:'What needs to be done?',
          autofocus:true,
          onKeyDown: -> (event) { handle_new_todo_key_down(event) },
          onChange: -> (event) { handle_change(event) },
          value: @state[:newTodo]
        })),
```

----
%small: application.rb

```ruby
  def handle_new_todo_key_down(event)
    return unless event.code == KEY_ENTER

    event.prevent

    val = @state[:newTodo].strip

    if val
      @props[:model] << val
      set_state(newTodo: '')
    end
  end
```

## Development strategy
* Try implementing it based on the React.js implementation.
* Reading the source code of React.js didn't give me any clues.
* Try porting it without knowing the details.
* Here now.

### Refactor & Rebuild
I'd like to gradually rebuild it to more Ruby-ish implementation while refactoring continuously.

## Ruby-ish implementation
* Object-oriented
    - class-base vs. prototype-base
* Module
    - CommonJS
* Meta programming

## isomophic

### If I dare answer the question "Why Ruby?"...

## Run the same code both in browser and on server

* Validation
* Model
* Routing

### Varidation
* Considering the responsiveness, client-side validation is preferred.
* Considering the security, server-side validation is preferred.
* We need both.

### Model
* Object mershaling

### Routing
* Ever wished that the URL helper could be used in JavaScript.

### Flux

#### ![](./data/images/flux-diagram.png)

### Ruby-ish solution
* The dataflow of Flux is one way and that is great.
* Feel uncomfortable when all data is expressed in the key-value manner.
* Transparent model between client and server is possible in the perspective of Flex (IMHO).

## Future
* Isomophic
    - Integration with server side
    - Interpret Flux as something similer to Hyalite.
* Desktop app using Electron
* Ruby motion and HyaliteNative

### Hobby programming
* Implementing the front-end for card game
* For Marjong, someday.

## Near Future
* Refactoring
* Testing
* Documentation

## Conclusion

* I made Hyalite, a Virtual DOM implementation in Ruby.
* We can write code in Ruby for web front-end development too.
* Fun programming!

### Thank you for your attention !!
#### [http://rubykaigi.youchan.org](http://rubykaigi.youchan.org)
