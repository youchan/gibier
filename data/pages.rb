class Hyaslide::Page0 < Hyaslide::PageBase
  def header
    h1(nil, "Writing web application in Ruby")
  end

  def content
    [].tap do |children|
      children << p({className:"author"}, "Yoh Osaki a.k.a @youchan")
      children << p({className:"icon"}, img({className: "", src: "./data/images/youchan.jpg"}))
    end
  end
end

class Hyaslide::Page1 < Hyaslide::PageBase
  def header
    h2(nil, "Prologue")
  end

  def content
    [].tap do |children|
    end
  end
end

class Hyaslide::Page2 < Hyaslide::PageBase
  def header
    h3(nil, "Do you write web application with Rails?")
  end

  def content
    [].tap do |children|
      children << h4(nil, "or other framework in ruby?")
    end
  end
end

class Hyaslide::Page3 < Hyaslide::PageBase
  def header
    h3(nil, "Does this happen to you?")
  end

  def content
    [].tap do |children|
      children << p(nil, "You were developing web application with Ruby on Rails, but somehow you ended up writing front-end in JavaScript.")
    end
  end
end

class Hyaslide::Page4 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << h4(nil, "Front-end development is becoming important today")
    end
  end
end

class Hyaslide::Page5 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << h4(nil, "I love ruby, so I want to write front-end in Ruby too.")
      children << p({className:"ruby"}, img({className: "", src: "./data/images/ruby.png"}))
    end
  end
end

class Hyaslide::Page6 < Hyaslide::PageBase
  def header
    h2(nil, "Who am I?")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "Yoh Osaki (@youchan)"),
                    li(nil, "Rails Girl Tokyo 5th (Sep 2015) organizer"),
                    li(nil, "Ubiregi inc."),
                    li(nil, "from Java to Ruby")
      )
    end
  end
end

class Hyaslide::Page7 < Hyaslide::PageBase
  def header
    h3(nil, "form Java to Ruby")
  end

  def content
    [].tap do |children|
      children << h4(nil, img({className: "java-to-ruby", src: "./data/images/java_to_ruby.jpg"}))
    end
  end
end

class Hyaslide::Page8 < Hyaslide::PageBase
  def header
    h3(nil, "Ubiregi")
  end

  def content
    [].tap do |children|
      children << p({className:"ubiregi-logo"}, img({className: "", src: "./data/images/ubiregi-logo.png"}))
      children << ul(nil,
                    li(nil, "Junkudo had using Ubiregi"),
                    li(nil, "iPad POS"),
                    li(nil, "iPad app + API"),
                    li(nil, "Ruby on Rails"),
                    li(nil, "Dashboard: Web app")
      )
      children << p({className:"ubiregi-ipad"}, img({className: "", src: "./data/images/ubiregi-ipad.png"}))
    end
  end
end

class Hyaslide::Page9 < Hyaslide::PageBase
  def header
    h3(nil, "Dashboard")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "Web front-end"),
                    li(nil, "Single page application"),
                    li(nil, "Backbone.js => React.js")
      )
      children << p({className:"space"}, "")
      children << p({className:"dashboard"}, img({className: "", src: "./data/images/dashboard.png"}))
    end
  end
end

class Hyaslide::Page10 < Hyaslide::PageBase
  def header
    h3(nil, "React.js")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "View framework using Virtual DOM"),
                    li(nil, "JSX"),
                    li(nil, "ReactNative - Same approach being applied to mobile apps."),
                    li(nil, "It's gettng lots of attention, but I, a rubyist, am feeling \"left out in the cold\".")
      )
    end
  end
end

class Hyaslide::Page11 < Hyaslide::PageBase
  def header
    h2(nil, "Hobby programming")
  end

  def content
    [].tap do |children|
    end
  end
end

class Hyaslide::Page12 < Hyaslide::PageBase
  def header
    h2(nil, "gohra")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "Ooedo RubyKaigi 2015"),
                    li(nil, "Card game rule engine"),
                    li(nil, "Describe the geme rule in Ruby DSL"),
                    li(nil, "Hobby programming"),
                    li(nil, "Front-end => ?")
      )
    end
  end
end

class Hyaslide::Page13 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << h4(nil, "I want to use what I love for my hobby programming.")
    end
  end
end

class Hyaslide::Page14 < Hyaslide::PageBase
  def header
    h2(nil, "Hyalite")
  end

  def content
    [].tap do |children|
      children << h4(nil, img({className: "hyalite", src: "./data/images/hyalite.jpg"}))
    end
  end
end

class Hyaslide::Page15 < Hyaslide::PageBase
  def header
    h3(nil, "Hyalite")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "My first rubygem."),
                    li(nil, "Ruby"),
                    li(nil, "Run in browser (Opal)"),
                    li(nil, "React.js like Virtual DOM")
      )
    end
  end
end

class Hyaslide::Page16 < Hyaslide::PageBase
  def header
    h2(nil, "Opal")
  end

  def content
    [].tap do |children|
      children << p({className:"opal"}, img({className: "", src: "./data/images/opal.png"}))
    end
  end
end

class Hyaslide::Page17 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << h4(nil, "After using it for a while, my impression is \"It works\".")
    end
  end
end

class Hyaslide::Page18 < Hyaslide::PageBase
  def header
    h2(nil, "The difference with MRI as a language.")
  end

  def content
    [].tap do |children|
    end
  end
end

class Hyaslide::Page19 < Hyaslide::PageBase
  def header
    h3(nil, "Symbol is String")
  end

  def content
    [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre><span class="p">{</span> <span class="ss">key: </span><span class="s2">"value"</span> <span class="p">}</span>
</pre></td></tr></tbody></table>
</div>
} } })
      children << ul(nil,
                    li(nil, "In this case, key is String in JavaScript."),
                    li(nil, "But Hash is different from Object in JavaScript...")
      )
    end
  end
end

class Hyaslide::Page20 < Hyaslide::PageBase
  def header
    h3(nil, "Kernel#proc")
  end

  def content
    [].tap do |children|
      children << p(nil, "Kernel#proc cannot be called without block.")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4</pre></td><td class="code"><pre><span class="k">def</span> <span class="nf">fun</span><span class="p">(</span><span class="o">*</span><span class="n">args</span><span class="p">,</span> <span class="o">&amp;</span><span class="n">block</span><span class="p">)</span> <span class="c1"># Argument of block type is not omissible.</span>
  <span class="vi">@proc</span> <span class="o">=</span> <span class="n">block</span>
  <span class="c1"># @proc = proc { yield }</span>
<span class="k">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
    end
  end
end

class Hyaslide::Page21 < Hyaslide::PageBase
  def header
    h2(nil, "React.js")
  end

  def content
    [].tap do |children|
      children << p({className:"react"}, img({className: "", src: "./data/images/react.png"}))
    end
  end
end

class Hyaslide::Page22 < Hyaslide::PageBase
  def header
    h2(nil, "Virtual DOM")
  end

  def content
    [].tap do |children|
      children << p(nil, "Instead of directory manipulating the Real DOM, we work with Virtual DOM and save the diff to Real DOM.")
    end
  end
end

class Hyaslide::Page23 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << h4(nil, img({className: "virtual-dom", src: "./data/images/virtual-dom.png"}))
    end
  end
end

class Hyaslide::Page24 < Hyaslide::PageBase
  def header
    h2(nil, "Hello React")
  end

  def content
    [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7</pre></td><td class="code"><pre><span class="kd">var</span> <span class="nx">HelloMessage</span> <span class="o">=</span> <span class="nx">React</span><span class="p">.</span><span class="nx">createClass</span><span class="p">({</span>
  <span class="na">render</span><span class="p">:</span> <span class="kd">function</span><span class="p">()</span> <span class="p">{</span>
    <span class="k">return</span> <span class="nx">React</span><span class="p">.</span><span class="nx">createElement</span><span class="p">(</span><span class="s2">"div"</span><span class="p">,</span> <span class="kc">null</span><span class="p">,</span> <span class="s2">"Hello "</span><span class="p">,</span> <span class="k">this</span><span class="p">.</span><span class="nx">props</span><span class="p">.</span><span class="nx">name</span><span class="p">);</span>
  <span class="p">}</span>
<span class="p">});</span>

<span class="nx">ReactDOM</span><span class="p">.</span><span class="nx">render</span><span class="p">(</span><span class="nx">React</span><span class="p">.</span><span class="nx">createElement</span><span class="p">(</span><span class="nx">HelloMessage</span><span class="p">,</span> <span class="p">{</span> <span class="na">name</span><span class="p">:</span> <span class="s2">"John"</span> <span class="p">}),</span> <span class="nx">mountNode</span><span class="p">);</span>
</pre></td></tr></tbody></table>
</div>
} } })
    end
  end
end

class Hyaslide::Page25 < Hyaslide::PageBase
  def header
    h2(nil, "Hello Hyalite")
  end

  def content
    [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9</pre></td><td class="code"><pre><span class="k">class</span> <span class="nc">HelloMessage</span>
  <span class="kp">include</span> <span class="no">Hyalite</span><span class="o">::</span><span class="no">Component</span>

  <span class="k">def</span> <span class="nf">render</span>
    <span class="no">Hyalite</span><span class="p">.</span><span class="nf">create_element</span><span class="p">(</span><span class="s2">"div"</span><span class="p">,</span> <span class="kp">nil</span><span class="p">,</span> <span class="s2">"Hello "</span><span class="p">,</span> <span class="vi">@props</span><span class="p">[</span><span class="ss">:name</span><span class="p">])</span>
  <span class="k">end</span>
<span class="k">end</span>

<span class="no">Hyalite</span><span class="p">.</span><span class="nf">render</span><span class="p">(</span><span class="no">Hyalite</span><span class="p">.</span><span class="nf">create_element</span><span class="p">(</span><span class="no">HelloMessage</span><span class="p">,</span> <span class="p">{</span> <span class="ss">name: </span><span class="s2">"John"</span> <span class="p">}),</span> <span class="n">mount_node</span><span class="p">)</span>
</pre></td></tr></tbody></table>
</div>
} } })
    end
  end
end

class Hyaslide::Page26 < Hyaslide::PageBase
  def header
    h3(nil, "opal-browser")
  end

  def content
    [].tap do |children|
      children << h5(nil, "Browser API wrapper")
      children << p({className:"small"}, "javascript")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre><span class="nb">document</span><span class="p">.</span><span class="nx">getElementsByClassName</span><span class="p">(</span><span class="s1">'container'</span><span class="p">);</span>
</pre></td></tr></tbody></table>
</div>
} } })
      children << p({className:"small"}, "opal-browser")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre><span class="vg">$document</span><span class="p">[</span><span class="s1">'.container'</span><span class="p">]</span>
</pre></td></tr></tbody></table>
</div>
} } })
    end
  end
end

class Hyaslide::Page27 < Hyaslide::PageBase
  def header
    h2(nil, "JSX")
  end

  def content
    [].tap do |children|
    end
  end
end

class Hyaslide::Page28 < Hyaslide::PageBase
  def header
    h3(nil, "Hello JSX")
  end

  def content
    [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7</pre></td><td class="code"><pre><span class="kd">var</span> <span class="nx">HelloMessage</span> <span class="o">=</span> <span class="nx">React</span><span class="p">.</span><span class="nx">createClass</span><span class="p">({</span>
  <span class="na">render</span><span class="p">:</span> <span class="kd">function</span><span class="p">()</span> <span class="p">{</span>
    <span class="k">return</span> <span class="o">&lt;</span><span class="nx">div</span><span class="o">&gt;</span><span class="nx">Hello</span> <span class="p">{</span><span class="k">this</span><span class="p">.</span><span class="nx">props</span><span class="p">.</span><span class="nx">name</span><span class="p">}</span><span class="o">&lt;</span><span class="sr">/div&gt;</span><span class="err">;
</span>  <span class="p">}</span>
<span class="p">});</span>

<span class="nx">ReactDOM</span><span class="p">.</span><span class="nx">render</span><span class="p">(</span><span class="o">&lt;</span><span class="nx">HelloMessage</span> <span class="nx">name</span><span class="o">=</span><span class="s2">"John"</span> <span class="o">/&gt;</span><span class="p">,</span> <span class="nx">mountNode</span><span class="p">);</span>
</pre></td></tr></tbody></table>
</div>
} } })
    end
  end
end

class Hyaslide::Page29 < Hyaslide::PageBase
  def header
    h3(nil, "Short hand")
  end

  def content
    [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10</pre></td><td class="code"><pre><span class="k">class</span> <span class="nc">HelloMessage</span>
  <span class="kp">include</span> <span class="no">Hyalite</span><span class="o">::</span><span class="no">Component</span>
  <span class="kp">include</span> <span class="no">Hyalite</span><span class="o">::</span><span class="no">Component</span><span class="o">::</span><span class="no">ShortHand</span>

  <span class="k">def</span> <span class="nf">render</span>
    <span class="n">div</span><span class="p">(</span><span class="kp">nil</span><span class="p">,</span> <span class="s2">"Hello "</span><span class="p">,</span> <span class="vi">@props</span><span class="p">[</span><span class="ss">:name</span><span class="p">])</span>
  <span class="k">end</span>
<span class="k">end</span>

<span class="no">Hyalite</span><span class="p">.</span><span class="nf">render</span><span class="p">(</span><span class="no">HelloMessage</span><span class="p">.</span><span class="nf">el</span><span class="p">(</span><span class="ss">name: </span><span class="s2">"John"</span><span class="p">),</span> <span class="n">mount_node</span><span class="p">)</span>
</pre></td></tr></tbody></table>
</div>
} } })
    end
  end
end

class Hyaslide::Page30 < Hyaslide::PageBase
  def header
    h2(nil, "Example")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, a({href: "http://todomvc.com/", target: "_blank"}, "TodoMVC"))
      )
    end
  end
end

class Hyaslide::Page31 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << h4(nil, a({href: "http://localhost:8000", target: "_blank"}, "Hyalite TodoMVC"))
    end
  end
end

class Hyaslide::Page32 < Hyaslide::PageBase
  def header
    h3(nil, "This slide app")
  end

  def content
    [].tap do |children|
    end
  end
end

class Hyaslide::Page33 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << p({className:"small"}, "config.ru")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10
11</pre></td><td class="code"><pre><span class="nb">require</span> <span class="s1">'bundler'</span>
<span class="no">Bundler</span><span class="p">.</span><span class="nf">require</span>

<span class="n">run</span> <span class="no">Opal</span><span class="o">::</span><span class="no">Server</span><span class="p">.</span><span class="nf">new</span> <span class="p">{</span> <span class="o">|</span><span class="n">s</span><span class="o">|</span>
  <span class="n">s</span><span class="p">.</span><span class="nf">append_path</span> <span class="s1">'app'</span>
  <span class="n">s</span><span class="p">.</span><span class="nf">append_path</span> <span class="s1">'node_modules'</span>

  <span class="n">s</span><span class="p">.</span><span class="nf">debug</span> <span class="o">=</span> <span class="kp">true</span>
  <span class="n">s</span><span class="p">.</span><span class="nf">main</span> <span class="o">=</span> <span class="s1">'application'</span>
  <span class="n">s</span><span class="p">.</span><span class="nf">index_path</span> <span class="o">=</span> <span class="s1">'index.html.haml'</span>
<span class="p">}</span>
</pre></td></tr></tbody></table>
</div>
} } })
    end
  end
end

class Hyaslide::Page34 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << p({className:"small"}, "application.rb")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10
11</pre></td><td class="code"><pre><span class="k">module</span> <span class="nn">App</span>
  <span class="k">def</span> <span class="nc">self</span><span class="o">.</span><span class="nf">render</span>
    <span class="no">Hyalite</span><span class="p">.</span><span class="nf">render</span><span class="p">(</span>
      <span class="no">Hyalite</span><span class="p">.</span><span class="nf">create_element</span><span class="p">(</span><span class="no">TodoApp</span><span class="p">,</span> <span class="p">{</span><span class="ss">model: </span><span class="n">model</span><span class="p">}),</span>
      <span class="vg">$document</span><span class="p">[</span><span class="s1">'.todoapp'</span><span class="p">])</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nc">self</span><span class="o">.</span><span class="nf">model</span>
    <span class="vi">@model</span> <span class="o">||=</span> <span class="no">TodoModel</span><span class="p">.</span><span class="nf">new</span>
  <span class="k">end</span>
<span class="k">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
    end
  end
end

class Hyaslide::Page35 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << p({className:"small"}, "application.rb")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10
11</pre></td><td class="code"><pre><span class="k">class</span> <span class="nc">TodoApp</span>
  <span class="kp">include</span> <span class="no">Hyalite</span><span class="o">::</span><span class="no">Component</span>
  <span class="kp">include</span> <span class="no">Hyalite</span><span class="o">::</span><span class="no">Component</span><span class="o">::</span><span class="no">ShortHand</span>

  <span class="k">def</span> <span class="nf">initial_state</span>
    <span class="p">{</span>
      <span class="ss">nowShowing: :all</span><span class="p">,</span>
      <span class="ss">editing: </span><span class="kp">nil</span><span class="p">,</span>
      <span class="ss">newTodo: </span><span class="s1">''</span>
    <span class="p">}</span>
  <span class="k">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
    end
  end
end

class Hyaslide::Page36 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << p({className:"small"}, "application.rb")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10</pre></td><td class="code"><pre><span class="nb">require</span> <span class="s1">'opal-router'</span>

<span class="c1"># ---- snip ----</span>

  <span class="k">def</span> <span class="nf">component_did_mount</span>
    <span class="n">router</span> <span class="o">=</span> <span class="no">Router</span><span class="p">.</span><span class="nf">new</span>
    <span class="n">router</span><span class="p">.</span><span class="nf">route</span><span class="p">(</span><span class="s1">'/'</span><span class="p">)</span> <span class="p">{</span> <span class="n">set_state</span><span class="p">(</span><span class="ss">nowShowing: :all</span><span class="p">)</span> <span class="p">}</span>
    <span class="n">router</span><span class="p">.</span><span class="nf">route</span><span class="p">(</span><span class="s1">'/active'</span><span class="p">)</span> <span class="p">{</span> <span class="n">set_state</span><span class="p">(</span><span class="ss">nowShowing: :active</span><span class="p">)</span> <span class="p">}</span>
    <span class="n">router</span><span class="p">.</span><span class="nf">route</span><span class="p">(</span><span class="s1">'/completed'</span><span class="p">)</span> <span class="p">{</span> <span class="n">set_state</span><span class="p">(</span><span class="ss">nowShowing: :completed</span><span class="p">)</span> <span class="p">}</span>
  <span class="k">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
    end
  end
end

class Hyaslide::Page37 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << p({className:"small"}, "application.rb")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10
11
12
13
14</pre></td><td class="code"><pre>  <span class="k">def</span> <span class="nf">render</span>

<span class="c1"># ---- snip ----</span>

      <span class="n">header</span><span class="p">({</span><span class="ss">className: </span><span class="s1">'header'</span><span class="p">},</span>
        <span class="n">h1</span><span class="p">(</span><span class="kp">nil</span><span class="p">,</span> <span class="s2">"todos"</span><span class="p">),</span>
        <span class="n">input</span><span class="p">({</span>
          <span class="n">className</span><span class="ss">:'new-todo'</span><span class="p">,</span>
          <span class="n">placeholder</span><span class="ss">:'What needs to be done?'</span><span class="p">,</span>
          <span class="n">autofocus</span><span class="ss">:true</span><span class="p">,</span>
          <span class="ss">onKeyDown: </span><span class="o">-&gt;</span> <span class="p">(</span><span class="n">event</span><span class="p">)</span> <span class="p">{</span> <span class="n">handle_new_todo_key_down</span><span class="p">(</span><span class="n">event</span><span class="p">)</span> <span class="p">},</span>
          <span class="ss">onChange: </span><span class="o">-&gt;</span> <span class="p">(</span><span class="n">event</span><span class="p">)</span> <span class="p">{</span> <span class="n">handle_change</span><span class="p">(</span><span class="n">event</span><span class="p">)</span> <span class="p">},</span>
          <span class="ss">value: </span><span class="vi">@state</span><span class="p">[</span><span class="ss">:newTodo</span><span class="p">]</span>
        <span class="p">})),</span>
</pre></td></tr></tbody></table>
</div>
} } })
    end
  end
end

class Hyaslide::Page38 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << p({className:"small"}, "application.rb")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10
11
12</pre></td><td class="code"><pre>  <span class="k">def</span> <span class="nf">handle_new_todo_key_down</span><span class="p">(</span><span class="n">event</span><span class="p">)</span>
    <span class="k">return</span> <span class="k">unless</span> <span class="n">event</span><span class="p">.</span><span class="nf">code</span> <span class="o">==</span> <span class="no">KEY_ENTER</span>

    <span class="n">event</span><span class="p">.</span><span class="nf">prevent</span>

    <span class="n">val</span> <span class="o">=</span> <span class="vi">@state</span><span class="p">[</span><span class="ss">:newTodo</span><span class="p">].</span><span class="nf">strip</span>

    <span class="k">if</span> <span class="n">val</span>
      <span class="vi">@props</span><span class="p">[</span><span class="ss">:model</span><span class="p">]</span> <span class="o">&lt;&lt;</span> <span class="n">val</span>
      <span class="n">set_state</span><span class="p">(</span><span class="ss">newTodo: </span><span class="s1">''</span><span class="p">)</span>
    <span class="k">end</span>
  <span class="k">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
    end
  end
end

class Hyaslide::Page39 < Hyaslide::PageBase
  def header
    h2(nil, "Development strategy")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "Try implementing it based on the React.js implementation."),
                    li(nil, "Reading the source code of React.js didn't give me any clues."),
                    li(nil, "Try porting it without knowing the details."),
                    li(nil, "Here now.")
      )
    end
  end
end

class Hyaslide::Page40 < Hyaslide::PageBase
  def header
    h3(nil, "Refactor & Rebuild")
  end

  def content
    [].tap do |children|
      children << p(nil, "I'd like to gradually rebuild it to more Ruby-ish implementation while refactoring continuously.")
    end
  end
end

class Hyaslide::Page41 < Hyaslide::PageBase
  def header
    h2(nil, "Ruby-ish implementation")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                  li(nil, "Object-oriented"),
                  ul(nil,
                    li(nil, "class-base vs. prototype-base")
      ),
                  li(nil, "Module"),
                  ul(nil,
                    li(nil, "CommonJS")
      ),
                    li(nil, "Meta programming")
      )
    end
  end
end

class Hyaslide::Page42 < Hyaslide::PageBase
  def header
    h2(nil, "isomophic")
  end

  def content
    [].tap do |children|
    end
  end
end

class Hyaslide::Page43 < Hyaslide::PageBase
  def header
    h3(nil, "If I dare answer the question \"Why Ruby?\"...")
  end

  def content
    [].tap do |children|
    end
  end
end

class Hyaslide::Page44 < Hyaslide::PageBase
  def header
    h2(nil, "Run the same code both in browser and on server")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "Validation"),
                    li(nil, "Model"),
                    li(nil, "Routing")
      )
    end
  end
end

class Hyaslide::Page45 < Hyaslide::PageBase
  def header
    h3(nil, "Varidation")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "Considering the responsiveness, client-side validation is preferred."),
                    li(nil, "Considering the security, server-side validation is preferred."),
                    li(nil, "We need both.")
      )
    end
  end
end

class Hyaslide::Page46 < Hyaslide::PageBase
  def header
    h3(nil, "Model")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "Object mershaling")
      )
    end
  end
end

class Hyaslide::Page47 < Hyaslide::PageBase
  def header
    h3(nil, "Routing")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "Ever wished that the URL helper could be used in JavaScript.")
      )
    end
  end
end

class Hyaslide::Page48 < Hyaslide::PageBase
  def header
    h3(nil, "Flux")
  end

  def content
    [].tap do |children|
      children << h4(nil, img({className: "", src: "./data/images/flux-diagram.png"}))
    end
  end
end

class Hyaslide::Page49 < Hyaslide::PageBase
  def header
    h3(nil, "Ruby-ish solution")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "The dataflow of Flux is one way and that is great."),
                    li(nil, "Feel uncomfortable when all data is expressed in the key-value manner."),
                    li(nil, "Transparent model between client and server is possible in the perspective of Flex (IMHO).")
      )
    end
  end
end

class Hyaslide::Page50 < Hyaslide::PageBase
  def header
    h2(nil, "Future")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                  li(nil, "Isomophic"),
                  ul(nil,
                    li(nil, "Integration with server side"),
                    li(nil, "Interpret Flux as something similer to Hyalite.")
      ),
                    li(nil, "Desktop app using Electron"),
                    li(nil, "Ruby motion and HyaliteNative")
      )
    end
  end
end

class Hyaslide::Page51 < Hyaslide::PageBase
  def header
    h3(nil, "Hobby programming")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "Implementing the front-end for card game"),
                    li(nil, "For Marjong, someday.")
      )
    end
  end
end

class Hyaslide::Page52 < Hyaslide::PageBase
  def header
    h2(nil, "Near Future")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "Refactoring"),
                    li(nil, "Testing"),
                    li(nil, "Documentation")
      )
    end
  end
end

class Hyaslide::Page53 < Hyaslide::PageBase
  def header
    h2(nil, "Conclusion")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "I made Hyalite, a Virtual DOM implementation in Ruby."),
                    li(nil, "We can write code in Ruby for web front-end development too."),
                    li(nil, "Fun programming!")
      )
    end
  end
end

class Hyaslide::Page54 < Hyaslide::PageBase
  def header
    h3(nil, "Thank you for your attention !!")
  end

  def content
    [].tap do |children|
      children << h4(nil, a({href: "http://rubykaigi.youchan.org", target: "_blank"}, "http://rubykaigi.youchan.org"))
    end
  end
end

Hyaslide.page_count = 55
Hyaslide.title = "Writing web application in Ruby"
