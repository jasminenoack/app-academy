u1 = User.create!(email: "jasmine@example.com", password: "password", confirm_password: "password")
u2 = User.create!(email: "bono@example.com", password: "u2rocks", confirm_password: "u2rocks")
u3 = User.create!(email: "lydia@example.com", password: "star_wars", confirm_password: "star_wars")

u1.notes.create!(track_id: 1, body: "I love this song")
u2.notes.create!(track_id: 1, body: "me too")


b1 = Band.create!(name: "Spin Doctors")
b2 = Band.create!(name: "Jonathan Coulton")
b3 = Band.create!(name: "MC Frontalot")
b4 = Band.create!(name: "Schaffer the Darklord")
b5 = Band.create!(name: "Brad Paisley")
b6 = Band.create!(name: "System of a Down")
b7 = Band.create!(name: "Kate Nash")
b8 = Band.create!(name: "Bright Eyes")
b9 = Band.create!(name: "Wheatus")

a1 = Album.create!(band_id: b1.id, name: "Pocket Full of Kryptonite", kind: "studio", year: 1991)
a2 = Album.create!(band_id: b2.id, name: "Smoking Monkey", kind: "studio", year: 2003)
a3 = Album.create!(band_id: b2.id, name: "JoCo LIVE", kind: "live", year: 2014)
a4 = Album.create!(band_id: b3.id, name: "Question Bedtime", kind: "studio", year: 2014)
a5 = Album.create!(band_id: b4.id, name: "Sick Passenger", kind: "studio", year: 2014)
a6 = Album.create!(band_id: b5.id, name: "Who Needs Pictures", kind: "studio", year: 1999)
a7 = Album.create!(band_id: b6.id, name: "Toxicity", kind: "studio", year: 2001)
a8 = Album.create!(band_id: b7.id, name: "Made of Bricks", kind: "studio", year: 2007)
a9 = Album.create!(band_id: b7.id, name: "My Best Friend is You", kind: "studio", year: 2010)
a10 = Album.create!(band_id: b7.id, name: "Girl Talk", kind: "studio", year: 2013)
a11 = Album.create!(band_id: b8.id, name: "Letting Off the Happiness", kind: "studio", year: 1998)
a12 = Album.create!(band_id: b9.id, name: "Hand Over Your Loved Ones", kind: "studio", year: 2003)
a13 = Album.create!(band_id: b9.id, name: "Pop, tracks & Death", kind: "studio", year: 2009)
a14 = Album.create!(band_id: b9.id, name: "Live at XM", kind: "live", year: 2004)

t1 = a1.tracks.create!(
  name: "Little Miss Can't Be Wrong",
  bonus: false,
  lyrics: <<-LYRICS
Been a whole lot easier since the bitch left town
Been a whole lot happier without that face around
Nobody upstairs gonna stomp and shout
Nobody out the back door gonna throw my laundry out
She holds the shotgun while you dote-se-doe
She want one man made of Hercules and Cyrano
Been a whole lot easier since the bitch is gone
Little miss, Little miss, Little miss can't be wrong

Little miss, Little miss, Little miss can't be wrong
Ain't nobody gonna bow no more when you sound your gong
Little miss, Little miss, Little miss can't be wrong
Whatcha go 'n' do to get into another one of these here rock 'n' roll tracks?

Other people's thoughts they ain't your hand-me-downs
Would it be so bad to simply turn around?
You cook so well, all nice and French
You do your brain surgery too mama with yer monkey wrench

Little miss, Little miss, Little miss can't be wrong
Ain't nobody gonna bow no more when you sound your gong
Little miss, Little miss, Little miss can't be wrong
What'd ya go 'n' do to get into another one of these here rock 'n' roll tracks?

I hope them cigarettes are gonna make you cough
Hope you hear this song and it pissed you off
I take that back I hope you're doing fine
And if I had a dollar I might give you ninety-nine.

Little miss, Little miss, Little miss can't be wrong
Ain't nobody gonna bow no more when you sound your gong
Little miss, Little miss, Little miss can't be wrong
What'd ya go 'n' do to get into another one of these here rock 'n' roll tracks?
  LYRICS
)
t2 = a1.tracks.create!(
  name: "Two Princes",
  bonus: false,
  lyrics: <<-LYRICS
One, two princes kneel before you
That what I said now
Princes, princes who adore you
Just go ahead now
One has diamonds in his pockets
That's some bread, now
This one said he wants to buy you rockets
Ain't in his head, now

This one he got a princely racket
That's what I said now
Got some Big Seal upon his jacket
Ain't in his head now
You marry him, your father will condone you
How 'bout that now
You marry me, your father will disown you
He'll eat his hat, now

Marry him, marry me
I'm the one that loved you baby can't you see?
Ain't got no future or family tree
But I know what a prince and lover ought to be
I know what a prince and lover ought be

Said if you want to call me baby
Just go ahead now
And if you like to tell me maybe
Just go ahead now
And if you wanted to buy me flowers
Just go ahead now
And if you like to talk for hours
Just go ahead now

Said one, two princes kneel before you
That what I said now
Princes, princes who adore you
Just go ahead now
One has diamonds in his pockets
That's some bread, now
This one said he wants to buy you rockets
Ain't in his head, now

Marry him, marry me
I'm the one that loved you baby can't you see?
Ain't got no future or family tree
But I know what a prince and lover ought to be
I know what a prince and lover ought be

Said if you want to call me baby
Just go ahead now
And if you like to tell me maybe
Just go ahead now
And if you wanted to buy me flowers
Just go ahead now
And if you like to talk for hours
Just go ahead now
And if you want to call me baby
Just go ahead now
And if you like to tell me maybe
Just go ahead now
And if you like to buy me flowers
Just go ahead now
And if you like to talk for hours
Just go ahead now
If you want to call me baby
Just go ahead now
And if you like to tell me maybe
Just go ahead now
If you want to buy me flowers
Just go ahead now
And if you like to talk for hours
Just go ahead now
Oh Baby!
Just go ahead now
Oh!
Just just go ahead now
Oh, your majesty!
Just go ahead now
Come on forget the King who... marry me!
Just go ahead now
Come on, come on, come on
Just go ahead now
Go ahead now
Just go ahead now, [etc.]
LYRICS
)
t3 = a1.tracks.create!(
  name: "How Could You Want Him (When You Know You Could Have Me?)"  ,
  bonus: false,
  lyrics: <<-LYRICS
I'm quite contented to take my chances
Against the Guildensterns & Rosenkrantzes
It's a matter of Cain & Abel
And I can feel your knee underneath the table

He doesn't dangle by the seraphim
He only wants a pretty face by him so
How could you want him when you know you could have me?

See the pigeons peck & peck to pay the dues
They peck a little extra to resole their shoes
He's with the pigeons pecking crumbs
I'm on my deathbed bleeding with the cherubim

He doesn't dangle by the seraphim
He only wants a pretty face by him so
How could you want him when you know you could have me?

Ferocious angels send me falling stars
But I know just how dangerous wishes are
Ferocious angels watch me come and go
But I'm not too smart to go barging off of roof tops, though

Sit out September on the window sill
'Cause you can't drink wine from a two dollar bill
Saint Christopher lives on the end of a quill
Leave him a diamond in your last will

He doesn't dangle by the seraphim
He only wants a pretty face by him so
How could you want him when you know you could have me?

How could you want him when you know you could have me?
How could you want him when you know you could have me?
How could you want him when you know you could have me?
How could you want him when you know you could have me?
LYRICS
)
t4 = a2.tracks.create!(
  name: "Ikea",
  bonus: false,
  lyrics: <<-LYRICS
Long ago in days of yore
It all began with a god named Thor
There were Vikings and boats
And some plans for a furniture store
It's not a bodega, it's not a mall
And they sell things for apartments smaller than mine
As if there were apartments smaller than mine

Ikea: just some oak and some pine and a handful of Norsemen
Ikea: selling furniture for college kids and divorced men
Everyone has a home
But if you don't have a home you can buy one there

So rent a car or take the bus
Lay your cash down and put your trust
In the land where the furniture folds to a much smaller size
Billy the bookcase says hello
And so does a table whose name is Ingo
And the chair is a ladder-back birch but his friends call him Karl

Ikea: just some oak and some pine and a handful of Norsemen
Ikea: selling furniture for college kids and divorced men
Everyone has a home
But if you don't have a home you can buy one there

Ikea: plywood, brushed steel
Ikea: meatballs, tasty
Ikea: Allen wrenches
All of them for free
All of them for me

I'm sorry I said Ikea sucks
I just bought a table for 60 bucks
And a chair and a lamp
And a shelf and some candles for you
I was a doubter just like you
Till I saw the American dream come true
In New Jersey, they got a goddamned Swedish parade

Ikea: just some oak and some pine and a handful of Norsemen
Ikea: selling furniture for college kids and divorced men
Everyone has a home
But if you don't have a home you can buy one there
LYRICS
)
t5 = a3.tracks.create!(
  name: "Code Monkey",
  bonus: false,
  lyrics: <<-LYRICS
Code Monkey get up get coffee
Code Monkey go to job
Code Monkey have boring meeting
With boring manager Rob
Rob say Code Monkey very diligent
But his output stink
His code not "functional" or "elegant"
What do Code Monkey think?
Code Monkey think maybe manager want to write god damned login page himself
Code Monkey not say it out loud
Code Monkey not crazy, just proud

Code Monkey like Fritos
Code Monkey like Tab and Mountain Dew
Code Monkey very simple man
With big warm fuzzy secret heart:
Code Monkey like you
Code Monkey like you

Code Monkey hang around at front desk
Tell you sweater look nice
Code Monkey offer buy you soda
Bring you cup, bring you ice
You say no thank you for the soda cause
Soda make you fat
Anyway you busy with the telephone
No time for chat
Code Monkey have long walk back to cubicle he sit down pretend to work
Code Monkey not thinking so straight
Code Monkey not feeling so great

Code Monkey like Fritos
Code Monkey like Tab and Mountain Dew
Code Monkey very simple man
With big warm fuzzy secret heart:
Code Monkey like you
Code Monkey like you a lot

Code Monkey have every reason
To get out this place
Code Monkey just keep on working
See your soft pretty face
Much rather wake up, eat a coffee cake
Take bath, take nap
This job "fulfilling in creative way"
Such a load of crap
Code Monkey think someday he have everything even pretty girl like you
Code Monkey just waiting for now
Code Monkey say someday, somehow

Code Monkey like Fritos
Code Monkey like Tab and Mountain Dew
Code Monkey very simple man
With big warm fuzzy secret heart:
Code Monkey like you
Code Monkey like you
  LYRICS
)
t6 = a3.tracks.create!(
  name: "Want You Gone",
  bonus: false,
  lyrics: <<-LYRICS
Well here we are again
It's always such a pleasure
Remember when you tried
to kill me twice?

Oh how we laughed and laughed
Except I wasn't laughing
Under the circumstances
I've been shockingly nice

You want your freedom?
Take it
That's what I'm counting on
I used to want you dead
but
Now I only want you gone

She was a lot like you
(Maybe not quite as heavy)
Now little Caroline is in here too

One day they woke me up
So I could live forever
It's such a shame the same
will never happen to you

You've got your
short sad life left
That's what I'm counting on
I'll let you get right to it
Now I only want you gone

Goodbye my only friend
Oh, did you think I meant you?
That would be funny
if it weren't so sad

Well you have been replaced
I don't need anyone now
When I delete you maybe
I'll stop feeling so bad

Go make some new disaster
That's what I'm counting on
You're someone else's problem
Now I only want you gone
Now I only want you gone
Now I only want you... gone
  LYRICS
)
t7 = a3.tracks.create!(
  name: "Mandelbrot Set",
  bonus: false,
  lyrics: <<-LYRICS
Pathological monsters! cried the terrified mathematician
Every one of them a splinter in my eye
I hate the Peano Space and the Koch Curve
I fear the Cantor Ternary Set
The Sierpinski Gasket makes me wanna cry
And a million miles away a butterfly flapped its wings
On a cold November day a man named Benoit Mandelbrot was born

His disdain for pure mathematics and his unique geometrical insights
Left him well equipped to face those demons down
He saw that infinite complexity could be described by simple rules
Used his giant brain and he turned the game around
And he looked below the storm
Saw a vision in his head
A bulbous pointy form
Picked his pencil up and he wrote his secret down

Just take a point called Z in the complex plane (Alternate: Take a point called C...)
Let Z1 be Z squared plus C (Alternate: Let Z1 be zero squared...) (or: ...plus Z)
And Z2 is Z1 squared plus C (or: ...plus Z)
And Z3 is Z2 squared plus C (or: ...plus Z) and so on
If the series of Zs will always stay
Close to Z and never trend away
That point is in the Mandelbrot Set

Mandelbrot Set, you're a Rorschach Test on fire
You're a day-glo pterodactyl
You're a heart-shaped box of springs and wire
You're one badass fucking fractal
And you're just in time to save the day
Sweeping all our fears away
You can change the world in a tiny way

Mandelbrot's in heaven, at least he will be when he's dead
Right now he's still alive and teaching math at Yale
He gave us order out of chaos, he gave us hope where there was none
His geometry succeeds where others fail
So if you ever lose your way, a butterfly will flap its wings
From a million miles away, a little miracle will come to take you home

Just take a point called Z in the complex plane (Alternate: Take a point called C...)
Let Z1 be Z squared plus C (Alternate: Let Z1 be zero squared...)
And Z2 is Z1 squared plus C
And Z3 is Z2 squared plus C and so on
If the series of Zs will always stay
Close to Z instead of trend away
That point is in the Mandelbrot Set

Mandelbrot Set, you're a Rorschach Test on fire
You're a day-glo pterodactyl
You're a heart-shaped box of springs and wire
You're one badass fucking fractal
And you're just in time to save the day
Sweeping all our fears away
You can change the world in a tiny way
And you're just in time to save the day
Sweeping all our fears away
You can change the world in a tiny way
Go on, change the world in a tiny way
Come on, change the world in a tiny way
  LYRICS
)
t8 = a3.tracks.create!(
  name: "Still Alive",
  bonus: false,
  lyrics: <<-LYRICS
This was a triumph.
I'm making a note here:
HUGE SUCCESS.
It's hard to overstate my satisfaction.

Aperture Science.
We do what we must because we can.
For the good of all of us
Except the ones who are dead.

But there's no sense crying over every mistake.
You just keep on trying till you run out of cake.
And the science gets done and you make a neat gun.
For the people who are still alive.

I'm not even angry.
I'm being so sincere right now.
Even though you broke my heart and killed me.
And tore me to pieces.
And threw every piece into a fire.
As they burned it hurt because
I was so happy for you!

Now these points of data make a beautiful line.
And we're out of beta, we're releasing on time.
So I'm GLaD I got burned.
Think of all the things we learned
For the people who are still alive.

Go ahead and leave me.
I think I prefer to stay inside.
Maybe you'll find someone else to help you.
Maybe Black Mesa...
THAT WAS A JOKE. Haha. FAT CHANCE.
Anyway, this cake is great.
It's so delicious and moist.

Look at me still talking when there's science to do.
When I look out there it makes me GLaD I'm not you.
I've experiments to run there is research to be done
On the people who are still alive

And believe me I am still alive.
I'm doing science and I'm still alive.
I feel FANTASTIC and I'm still alive.
While you're dying I'll be still alive.
And when you're dead I will be still alive.

Still alive
Still alive
  LYRICS
)
t9 = a4.tracks.create!(
  name: "Start Over",
  bonus: false,
  lyrics: <<-LYRICS
Little Red Riding Hood was in good
with the food distribution, by her own volition
choosing to sincerely deliver
to old folks: succor; also vigor;
cheese and crackers; salt and coffee;
medicine to help the heart beat softly.
Awfully kind in her mission,
Red was (yes) in a head-on collision
with the forces of trouble,
long in the tooth plus stubble. And this goes double
for all little girls: know who wolves are.
Don’t be telling them where you’re going, how far
in what direction it is, especially if
it’s the unguarded cottage where Grama lives.
This is just common sense
(with which Little Red dispensed).
Hence, she proceeded on her way
through the woods to Grama’s place.
Little Red Riding Hood rolled up,
took one look and was like what the... uh,
what the heck? Grama got a hairy neck?
Teeth enough to get wrecked?
Next up: wood axe swinging.
That’s how it happened. That’s all I’m singing.

That’s the story (that ain’t how it happened...)
I won’t start over if you don’t stop yapping.
(shhhh)

Wolves got it hard on this earth,
ever the subjects of defamation and mirth,
first in line to be out there, lurking,
eyeing ingénues and smirking,
working on a master plan,
trying to get fed about the best he can.
Wondering if Grama got much meat,
endeavoring not to be indiscreet:
“How many them baskets she go through a month?
How does she react when she misses lunch?
And what direction was she living in, again?
Well, you better hurry up and go and visit her then.”
But wolves are speedier than little girls.
Barely pausing to devour jackrabbits and squirrels,
the wolf arrived.
All the rest, despicable lies.
All that talk of assumed identity,
let it be. This wolf was indelibly
wolf-like, forthright too.
He said, “Grama, here’s what I’ll do:
swallow you whole, your kinfolk for after,
then I’ll keep living, so you don’t have to.
Sorry, starving wolf, no choice.
To get in the gullet, just follow my voice.”

(That ain’t how it happened...)

All right, Grama was hanging alone,
cultivating the medicine for the glaucoma.
She paid rent in the forest. It was inexpensive.
Grama’s house was in the intensively
wolf-rife section of town.
She didn’t mind, she liked a wild hound.
Sound at the door: an intruder!
“Is that you, Red? You brought food for
me to eat?” “Nope, the opposite.
No hard candy, no soft chocolate.
Just a wolf belly for you to inhabit,
and I will need your nightshirt for the next gambit.”
Clandestinely reclining in bed,
the wolf awaits (for Red!),
expecting their usual banter:
“How’s school?” “Fine, Grama,
here’s food.” “Thanks dear.”
Instead it’s all, “What’s up with the ears?
Eyes? Nose? Throat? Teeth?”
“Little Red Riding Hood, why you giving me grief?
Bodies change as the years advance,
soft features grow unkind to the glance,
and hairs sprout.
All of it the better for you getting in my mouth!”
“Wow, it’s dark in here,” says Grama.
Here comes the wood axe, swinging like “Yeah, y’all!”
Old woman, come on back out,
and you keep the axe. Wolves abound.

That’s the story (that ain’t how it happened...)
That’s all I got, so you commence napping.
  LYRICS
)
t10 = a5.tracks.create!(
  name: "Do Sex",
  bonus: false,
  lyrics: <<-LYRICS
Oh my! Look at all you people in this room
I've been watching you file in for an hour or two
But none of you seem to see the black and purple suited fella
Sitting all alone at the bar, sipping on a Stella
'Til the soundguy steps to me and says "It's time"
That's my cue to kick some killer rhymes
As I step up on the stage and hop into the spotlight
Flip the power switch on my wireless mic
And go Rappity, Rappity, Rappity, Rappity, Rappity, Rappity, Rappin'
Uh, yeah that's when it first starts happenin'
Now all you acting like you want a little action, see
Macking on me tactlessly, all up on my package - please
I'm gonna break it down and make it see through
As I delegate some invitations to my green room
Who's it going to be? You? You? Maybe you?
Listen, this is what I'm gonna do

I'mma do sex to all of you
I'mma do sex to all of you
Every last one of you
I'mma do sex to all of you
I'mma do sex to everybody in this room

I'mma do sex to all of you
I'mma do sex to all of you
Every last one of you
I'mma do sex to all of you
I'mma do sex to everybody in this room

Take a moment, let this awesome promise wash across you
Just the thought of all the sex that I'mma do to you has got you all so hot and bothered
Gnawing on your bottom lips, excited
All your fantasies involving me will soon be satisfied and
I will get it started all your parts will start to tingle now
Oh my god, you are so psyched and nobody is singled out
I want to put you all inside my mouth, all of you, and swallow you
And when I say all of you, I mean ALL of you
Ladies, let's form a single file line
Maybe undress first, to save a little time
Oh and Fellas! Oh Yeah I'm talking to the dudes too
Guess who else I'mma do sex to? Here's a hint YOU
Oooh regardless of your weight or race or gender
I'mma do you! And that goes for you too, bartender!
It's an orgy and you won't attend a bigger one this year
Man - it's about to look like it's Caligula in here

When I do sex to all of you
When I do sex to all of you
Every last one of you
When I do sex to all of you
When I do sex to everybody in this room

When I do sex to all of you
When I do sex to all of you
Every last one of you
When I do sex to all of you
When I do sex to everybody in this room

And when it happens, it'll blow your mind
It'll shatter the fabric of your reality you'll find
That you were once so sweet and kind until I got you hot and naughty
I'mma do a bunch of weird stuff to your body
Oh! La-Di-Da-Di baby I'mma use the force
I'mma lock the doors, I'mma drop your drawers
Everybody's getting naked like they're Lady Godiva
Everybody's gonna wear a layer of my saliva
And I'mma going in and out of you, you're going in and out of me
Remember! Nobody do each other, keep me at the center
Of attention- did I mention what you'll get for free?
Everybody at this party's gonna get an STD!
No inhibitions, no indecision just id-driven whim
Hedonistic debauchery in every room that I'm in
Oh you know I'm so impulsive, I just roll with the flow
In fact, never mind- I've changed my mind tonight I'm going home- peace

I'mma do sex to NONE of you
I'mma do sex to none of you
Not a single one of you
I'mma do sex to none of you
I'mma do sex to nobody in this room

I'mma do sex to none of you
I'mma do sex to none of..
Well maybe just one of you
I'mma do sex to none of you
I'mma do sex to nobody in this room
  LYRICS
)
t11 = a5.tracks.create!(
  name: "Afraid of Everything",
  bonus: false,
  lyrics: <<-LYRICS
(Be afraid)

Here comes the Cowardly Lion
Watch him crumble into dust and powder, he's frightened
Watch him talk a big game feigning he's the killing sort
And not some blankie clutching thumb sucker in a pillow fort
All locked doors, all windows barred
Every little last thing leaves him feel a little more scarred
Phobias unfocused, fears and ADD
Yeah, he's afraid of everything- I'm afraid he's me

When all of it's scary, when bravery's buried
Whistle past cemeteries, of daily dread we sing
When heart rates will race, when fears never faced
There is no place that's safe, you're afraid of everything

Yeah, I'm afraid everyday of everything and everyone
I used to be afraid of the dark now I'm afraid of the sun
I used to flee to basements, now I hide on my roof
I used to fear the unknown, now I'm terrified of the truth
Unruly groups of youths on the train
Scare me more than growing older did when I was their age
Afraid of day jobs, stray dogs and swarms of wasps
Brain clots, but not as much as of New York cops
Laser pointers and terrorists disappointing my parents
And I swear it's terrifying my appointments with therapists
Who wanna prescribe drugs that give me nightmares and shakes
I fear my mistakes heights, thugs, spiders and snakes
Fistfights, forests, floods, and fresh blood, missing flights and ERs, bedbugs, landlords, handguns, prisons, dentists, tetanus, epar, redrum
I'm scared I'm unstable from what I've done to my health
Knowing what I'm capable of- I'm afraid of myself

When all of it's scary, when bravery's buried
Whistle past cemeteries, of daily dread we sing
When heart rates will race, when fears never faced
There is no place that's safe, you're afraid of everything

I get the chills when unlisted digits hit up on my phone
I'm scared witless of both commitment and of being alone
Horrified of my ex-wife, mortified by my sex life
And of what I did the day before but more for the next night
Petrified of failure, but less than of success
Restless nights spent fretting about irrelevance and stress
Maybe shouldn't have abandoned, ran away from my band
Afraid of making fans mad, yeah I'm afraid of my fans!
Afraid that my colleges find me the clown in their company
And that the people I start fights with on the internet will come for me
Worried that this record's hated, no one will get it
And that I'll never have kids and that one day I'll regret it
so the time between gigs I spend alone in my bed
Afraid of all of it, covers pulled up over my head
And wait for shows to play because being a fool on stage
Is the only thing in this world of which I'm not afraid!

When all of it's scary, when bravery's buried
Whistle past cemeteries, of daily dread we sing
When heart rates will race, when fears never faced
There is no place that's safe, you're afraid of everything
  LYRICS
)
t12 = a5.tracks.create!(
  name: "Tomgirl",
  bonus: false,
  lyrics: <<-LYRICS
Hey Girls!

Whooo!

Well, Alright

Ever since I was a little boy, I've always been a little bit different
Than all my friends, especially men. I've always been a bit of a misfit
Other boys were so aggressive, I was just so sensitive
Passionate about arts and crafts, I had so much to give
I never liked football, never played sports
But I loved musical theater of course!
Wouldn't go camping or hunting. The straights
So often misread all of these traits
As being gay, but I'm not gay baby, I'm just a Tomgirl

Ooh!

Maybe it's cuz I was raised by a single mother
Mama taught me 'bout the movies mostly watching costume dramas
I got a taste for playing dress-up, but fighting- Oh! No chance
I played with GI Joes, but all of my stories had romance
Today, I'm much the same but maybe more so I think
At any age given the option of blue, I'll always choose pink
I read fashion magazines for the celebrity gossip
I love America's Next Top Model, my girlfriends won't even watch it
And on my list of guilty pleasures, entered near the top would be
The dashing Hugh Grant acting in romantic comedies
I'm not some odd anomaly, I've gotta be me and he is a Tomgirl

I'm a Tomgirl, baby alright
I'm just a Tomgirl swinging my imaginary braids
I'm a Tomgirl, baby tonight
And if you see me skipping down your street
Give me a thumbs up, and I'll be like sweet
Give me a high-five, step aside I'll be on my way
I'm a Tomgirl, baby okay

And I cry, oh my God how I cry
At the drop of every dime
It's like I'm crying all the gosh darn time
But I don't really mind, baby
It's fine, cuz I'm a Tomgirl

(Ladies & Gentleman, on the organ solo: Mr. Dave Famous)

And when I feel dour, I do a thing that seems silly
I send myself flowers, my faves are stargazer lilies
My whole apartment smells like lavender, after I dream about going out
In a ponytail and tanktop with a bra-strap showing
No one claims that I'm a women in the body of a man
But that said, I tend to favor all of my transgendered fans
You may ask, why don't you cross-dress I'm sure you'd look cute
I say I do, because the women I want are the one's who wear suits, shoot
I get uncomfortable when people call me mister
Got a girl, and I can't help but kick my toe up when I kiss her
If I had fifty sisters I couldn't be more of a Tomgirl

I'm a Tomgirl, baby alright
I'm just a Tomgirl swinging my imaginary braids
I'm a Tomgirl, baby tonight
And if you see me skipping down your street
Give me a thumbs up, and I'll be like sweet
Give me a high-five, step aside I'll be on my way
I'm a Tomgirl, baby okay

And it's safe to say I'm more than a bit of a feminine touch
I just relate to ladies better than the gentleman and such
And guess what? That's why your girlfriend's love me so much
Cuz I'm a Tomgirl
LYRICS
)
t13 = a5.tracks.create!(
  name: "Giant Iron Snake",
  bonus: false,
  lyrics: <<-LYRICS
War has torn this land apart, darkness is fallin'
Stalling industry is ground to a halt, vultures are callin'
All the people crowd into the streets, sirens and cries
Our last chance to leave the island, our last chance to survive
The people speak of our three queens, all were forced to flee
Into exile- to a lost isle, far across the sea
They have summoned all of their subjects to follow their leads
Some heed the call, some follow in search of their families
The road will be rough, I'm sure, could lead me to a grave
But I've lived life as a coward, now is the time to be brave
A simple worker, a common peasant, not much of a man at all
But if I do this, I will be a Hero proud and standing tall
The water is too choppy, so I go beneath the streets
Into the tunnels, dug for centuries that lead to the east
The legends speak of a creature, that lives here underneath
A subterranean colossus, a mechanical beast

So I go - Down, down beneath these streets
But I know - The Giant Iron Snake is waiting for me
And if so - I'll drive my blade into the belly of the beast
And if I do something, I will be something

So I go - Down, down beneath these streets
But I know - The Giant Iron Snake is waiting for me
And if so - I'll drive my blade into the belly of the beast
And if I do something, I will be something

I feel it before I hear it, I hear it before I see it
The rumbling roar of the beast builds to screeches
Releases the stones from the walls, dust fills the room
In the darkness, I feel the bones - these catacombs are a tomb
BOOM!
The Giant Iron Snake approaches, slithering
It's eyes light up the dark, and it's glistening - it's listening
I know it knows that I'm here, it slows as it nears
My moment to strike arrives, show it no fear
I go YAH! and thrust my blade into it's scaly iron side
Tear a hole open with both hands, crawl into it's insides
And I find in the beast's belly, all of it's previous hunters
Half-eaten bodies of others, numbering hundreds
All the dirty and dead eyed survivors frozen in state
They tried and died before me and met horrible fates
There's not a moment to wait, no way I'll die in this place
So help me God, I will fight or ride this Giant Iron Snake

And I know - If I can harness it, I can ride the beast
But Oh No - The Giant Iron Snake will not go in peace
If I'm slow - that awful monster will deliver defeat
And if I do nothing, I will be nothing


And I know - If I can harness it, I can ride the beast
But Oh No - The Giant Iron Snake will not go in peace
If I'm slow - that awful monster will deliver defeat
And if I do nothing, I will be nothing

Suddenly the serpent lurches forward, tossing me
Into the bodies, it's stomach contents jostling
I scramble in it's guts for footing, I clutch and find
The cold, steely bones of the giant snake's iron spine
I fasten it with straps and give it a powerful yank
And the creature leaps forward faster with the force of a tank
Thrashing from side to side with all of it's might
Until it bursts through the bedrock, and into the moonlight
It launches and crashes upon the beach with a BOOM!
Expelling me and the others from it's multiple wounds
Waiting there to meet us on the isle are our three queens
Along with our children, spouses and other refugees
A welcome of wine awaits, but first I turn and see
The injured Giant Iron Snake slipping back beneath the sea
As it heals itself our eyes meet, and at last the creature speaks
It says... (Stand Clear of the Closing Doors, Please)

Stand clear of the closing doors, please
Said The Giant Iron Snake to me in broken human-ese
I have bested the beast, it has delivered me to Queens
If you see something, say something - say something

Stand clear of the closing doors, please
Said The Giant Iron Snake to me in broken human-ese
I have bested the beast, it has delivered me to Queens
If you see something, say something - say something
  LYRICS
)
t14 = a6.tracks.create!(
  name: "The Nervous Breakdown",
  bonus: false,
  lyrics: <<-LYRICS
(instrumental)
  LYRICS
)
t15 = a7.tracks.create!(
  name: "Chop Suey",
  bonus: false,
  lyrics: <<-LYRICS
Wake up
Grab a brush and put a little (makeup)
Grab a brush and put a little
Hide the scars to fade away the (shakeup)
Hide the scars to fade away the
Why'd you leave the keys upon the table?
Here you go create another fable
You wanted to
Grab a brush and put a little makeup
You wanted to
Hide the scars to fade away the shakeup
You wanted to
Why'd you leave the keys upon the table?
You wanted to
I don't think you trust
In, my, self righteous suicide
I, cry, when angels deserve to die, DIE
Wake up
Grab a brush and put a little (makeup)
Grab a brush and put a little
Hide the scars to fade away the (shakeup)
Hide the scars to fade away the
Why'd you leave the keys upon the table?
Here you go create another fable
You wanted to
Grab a brush and put a little makeup
You wanted to
Hide the scars to fade away the shakeup
You wanted to
Why'd you leave the keys upon the table?
You wanted to
I don't think you trust
In, my, self righteous suicide
I, cry, when angels deserve to die
In, my, self righteous suicide
I, cry, when angels deserve to die
Father, father, father, father
Father into your hands, I commend my spirit
Father into your hands
why have you forsaken me
In your eyes forsaken me
In your thoughts forsaken me
In your heart forsaken, me oh
Trust in my self righteous suicide
I, cry, when angels deserve to die
In my self righteous suicide
I, cry, when angels deserve to die
LYRICS
)
t16 = a8.tracks.create!(
  name: "Foundations",
  bonus: false,
  lyrics: <<-LYRICS
Thursday night,
Everything's fine,
Except you've got that look in your eyes,
When I'm telling a story
And you find it boring your thinking of something to say
You'll go along with and then drop it
And you Humiliate me, in front of our friends

Then I'll use that voice what you find annoyin'
And say something like
"Intelligent input darlin' why don't you just have another beer then?"

Then you call me a bitch and everyone we're with will be embarrassed,
And I won't give a shit

My fingertips are holding onto the
Cracks in our foundations,
And I know that I should let go,
But I can't
And every time we fight I know its not right,
Every time that your upset and I smile
I know I should forget, but I can't

You said I must eat so many lemons,
Cause I am so bitter
I said "I'd rather be with your friends mate,
Cause they are much fitter"

Yes it was childish
And you got aggressive
And I must admit that I was a bit scared,
But it gives me thrills to wind you up

My fingertips are holding onto the
Cracks in our foundations,
And I know that I should let go,

But I can't
And every time we fight,
I know its not right,
Every time that your upset and I smile,
I know I should forget,
But I can't

Your face is pasty,
Cause you've gone and got so wasted,
What a surprise,
Don't want to look at your face,
Cause its making me sick

You've gone and got sick on my trainers,
I only got these Yesterday
Oh my gosh, I cannot be bothered with this

Well I'll leave you there till the mornin',
And I purposely wont turn the heating on
And dear God, I hope I'm not stuck with this one

My fingertips are holding onto the
Cracks in our foundations,
And I know that I should let go,
But I can't
And every time we fight,
I know its not right,
Every time that your upset and I smile,
I know I should forget,
But I can't

And every time we fight I know it's not right,
Every time that you're upset and I smile
I know I should forget, but I can't

And every time we fight I know it's not right,
Every time that you're upset and I smile
I know I should forget, but I can't
  LYRICS
)
t17 = a8.tracks.create!(
  name: "Dickhead",
  bonus: false,
  lyrics: <<-LYRICS
Why you being a dickhead for?
Stop being a dickhead
Why you being a dickhead for?
You're just fucking up situations

Why you being a dickhead for?
Stop being a dickhead
Why you being a dickhead for?
You're just fucking up situations

Shiny floor, slippery feet
Lights are dim, my eyes can't meet
The reflection that turns my images
Upside down so I can't see

Think you know everything
You really don't know nothing
I wish that you were more intelligent
So you could see that what you are doing is
So shitty, to me

Thirty five,
People couldn't count,
On two hands the amount of times you made me stop,
Stop and think why are you being such a dickhead for?

Stop being a dickhead,
Why you being a dickhead for?
You're just fucking up situations,
Why you being a dickhead for?
Stop being a dickhead,
Why you being a dickhead for?
You're just fucking up situations

Stop, don't show, just have a think before you...
Wil you, stop, now don't show, just have a think before you...
Will you stop, no don't show, just have a think before you...
And, stop, don't show, just have a think before you...

Cos my brain and my bones don't want to take, this anymore
My brain and my bones don't want to take, this anymore
My brain and my bones don't want to take, this anymore
My brain and my bones don't want to take, this anymore, so

Why you being a dickhead for?
Stop being a dickhead
Why you being a dickhead for?
You're just fucking up situations

Why you being a dickhead for?
Stop being a dickhead
Why you being a dickhead for?
You're just fucking up situations
  LYRICS
)
t18 = a9.tracks.create!(
  name: "I've Got a Secret",
  bonus: false,
  lyrics: <<-LYRICS
I've got a secret, I can't tell you
I've got a secret, I can't tell you
I've got a secret, I can't tell you
I've got a secret, I can't tell you

You would judge
You would judge
You would judge
You would judge

I've got a secret, I can't tell you
I've got a secret, I can't tell you
I've got a secret, I can't tell you
I've got a secret, I can't tell you

You would judge
You would judge
You would judge
You would judge

I've got a secret, I can't tell you
I've got a secret, I can't tell you
I've got a secret, I can't tell you
I've got a secret, I can't tell you

You would judge
You would judge
You would judge
You would judge

Why can't we be friends?
We can't pretend you don't love me
You don't love me

Why can't I kiss her lips?
Why can't I be with him?
Homophobic pricks
Homophobic
  LYRICS
)
t19 = a10.tracks.create!(
  name: "Lullaby for an Insomniac",
  bonus: false,
  lyrics: <<-LYRICS
Another day goes by
And I don't wash my hair
Another night is spent
Wishing you were here
My skin it looks so pale
What's that over there?

Hiding in the shadows
Nothing can done
To ease my mind
I want to see the sun

Another day goes by
And I don't wash my hair
Another night is spent
Wishing you were here
My skin it looks so pale
What's that over there?

Too much stuff that I keep
I don't know what for
I don't have the guts
My clothes are all over the floor

Another day goes by
And I don't wash my hair
Another night is spent
Wishing you were here
My skin it looks so pale
What's that over there?

Sentimental value
The unopened mail
Lipstick, powder puff
I'm afraid that I might fail

And I think I'm falling down again
So I think about all of my good friends
And I wish them the best
I take comfort in
Knowing I have them
LYRICS
)
a10.tracks.create!(
  name: "Death Proof",
  bonus: false,
lyrics: <<-LYRICS
You can spend your whole life
Getting down on one thing
You can waste all your time on one idea
You can get your little brain
Into one big mess
But what you gonna do now, baby, when it all caves in?

Burn, burn, burn my heart baby
Take a piece cause I don't need all of it
Don't have time for your cruel ways
And I ain't wondering 'bout numbered days
Cause…
I don't have time to die

Doctor, doctor
My temperature is rising
My heart is beating right out of my chest
Tell me, tell me doctor
That you can get rid of it
Let me keep what I need
And you can burn the rest
Cause…
I made a deal with death

Burn, burn, burn my heart baby
Take a piece, yeah I don't need all of it
Don't have time for your cruel ways
And I ain't wondering 'bout numbered days
Cause…
I don't have time to die

Burn, burn, burn my heart baby
Take a piece, yeah I don't need all of it
Don't have time for your cruel ways
And I ain't wondering 'bout numbered days
Cause…
I don't have time to die
I don't have time to die
I don't have time to die
LYRICS
)
a10.tracks.create!(
  name: "Vonventional Girl",
  bonus: false,
lyrics: <<-LYRICS
I’m sick of being the bitch
That you think I am
Well, I never understood
Understood that man
Well, it’s funny how these kind of things
Happen to them
When you never even think they would happen again

Well, I’m sick of being the bitch
That you think I am
Well, I never understood
Understood that man
Well, it’s funny how these kind of things
They happen to them
When you never even think they would happen again

I gave you everything
You did not let me in
My words caught in between
Knowing what was good for me

What’s the difference between
Living free and hurting me
This has been quite challenging
But now I’m thinking differently

Too proud to ask for help
That makes it difficult
Should I just follow suit? Try and figure out myself?
Or should I concentrate
Concentrate on myself?
Or will that leave me here inside my low self-obsessed life?

Lines in lines, I'm sick of standing in lines
I'm just about ready to go get mine
And yeah, you like me, you kinda like me
But if I was a guy then I think you'd love me
Well I'm just a girl
And that's good enough for me

Hey hey!

I’m sick of being the bitch
That you think I am
Well, I never understood
Understood that man
Well, it’s funny how these kind of things
Happen to them
When you never even think they would happen again

I’m sick of being the bitch
That you think I am
Well, I never understood
Understood that man
Well, it’s funny how these kind of things
They happen to them
When you never even think they would happen again

I’m sick of being the bitch
That you think I am
Well, I never understood
Understood that man
Well, it’s funny how these kind of things
They happen to them
When you never even think they would happen again

I’m sick of being the bitch
That you think I am
Well, I never understood
Understood that man
Well, it’s funny how these kind of things
Happen to them
When you never even think they would happen again
LYRICS
)
a11.tracks.create!(
  name: "The City Has Sex",
  bonus: false,
lyrics: <<-LYRICS
The city has sex with itself I suppose
As the concrete collides, well, the scenery grows
And the lonely once bandaged lay fully exposed
They undressed their wounds for each other
And there's a boy in a basement with a four track machine
He's been strumming and screaming all night, down there
The tape hiss will cover the words that he sings,
They say it's better to bury your sadness
In a graveyard or garden that waits for the spring
To awake from its sleep and burst into green
Well I've cried and you would think I'd be better for it
But the sadness just sleeps and it stays in my spine
For the rest of my life
And I've learned and you'd think I'd be something more now,
But it just goes to show it is not what you know
It's what you were thinking at the time.
This feeling's familiar, I've been here before
In a kitchen this quiet I waited for
A sign or just something that might reassure me of anything close
To meaning or motion with a reason to move
I need something, I want to be close to
And I scream, but I still don't know why I do it
'Cause the sound never stays it just swells and decays
So what is the point?
WHY TRY TO FIGHT WHAT IS NOW SO CERTAIN?
THE TRUTH IS ALL THAT I AM IS A PASSING EVENT THAT WILL BE FORGOTTEN.
LYRICS
)
a11.tracks.create!(
  name: "A Poetic Retelling Of An Unfortunate Seduction",
  bonus: false,
lyrics: <<-LYRICS
The language in the dimmer rooms seems to represent its light source well
How soft they speak and seem to be at peace
With the movement of the music and the madness that is pulling me into this
And the shades of the lamps are woven red
The light, it stains and consecrates
Anointing all forgotten forms that swirl and smoke
And haunt this place
The girls in gowns all nurse the dark
Pulling it near to their swelling breasts
And watch as it seeps to their hearts
And beats within their virgin chests
And here I know seduction breeds from wanton hearts that would
Seduce and grows and spreads its vine
And leaves embracing those who might have moved
But now we're made to drink the night from vials black and thick
With such intoxicating delights would leave you drunk
Inside this dream
And you watch them take the light from you
And you find yourself on a velvet couch
Tasting the skin of a foreign girl
Her eyes are black and wet like oil
And she ties your hands with a string of pearls
And you tremble like a frightened bird
As she closes in and captures you to place you
In a silver cage deep within her poisoned womb
So once your safe inside, she might let you out
To fly in circles around the room
But its always night and there is no moon
And you wonder if you are alive
And you're not sure if you want to be
But you drink her sweat like it was wine
And you lay with her on a bed of blue and its awful sweet
Like the fruit she cuts and feeds to you
LYRICS
)
a12.tracks.create!(
  name: "The Song That I Wrote When You Dissed Me",
  bonus: false,
lyrics: <<-LYRICS
Hey there Mr. Marlboro man, what you gonna do,
When there's nobody left but your choke smoking self to abuse?
Hey there Mr. C.E.O man, where you gonna be,
When your daughter and me hop the first cheap flight to Fiji? Or Paris?

There you go telling me how I feel again,
There you go telling me what you need again,
There you go telling me how to be again,
Just like you, aint it true?
But like that nasty King Kong,
Cock strong and half a block long,
There weren't nothing as the song that I wrote when you dissed me.

Hey there Mr. Fraternity boy, what you gonna say,
When its time to admit to your family and shit that you're gay, anyway,
Hey there Mr. Head-In-The-Clouds, you know what I found?
Got the tape of the rape and that ass that you pound, how profound, pass
Around,

There you go telling me how I feel again,
There you go telling me what you need again,
There you go telling me how to be again,
Just like you, aint it true?
But like that nasty King Kong,
Cock strong and half a block long,
There weren't nothing as the song that I wrote when you dissed me,
Just like that nasty King Kong,
Cock strong and half a block long,
There weren't nothing as the song that I wrote when you dissed me.

Everybody Lunch,
Lunch,
Lunch,
Lunch,
Yeah everything's alright,
Leave it alone tonight,
Yeah everything's ok,
Just tell your mom you're gay,

Yeah yeah,
Just like that nasty King Kong,
Cock strong and half a block long,
There weren't nothing as strong,
As that nasty King Kong,
Just like that nasty King Kong,
Cock strong and half a block long,
There weren't nothing as strong as the song that I wrote,
Motherfucker.
LYRICS
)
a12.tracks.create!(
  name: "Lemonade",
  bonus: false,
lyrics: <<-LYRICS
Just tell me his name,
Just tell me you didn't get laid in our bedroom.
And was it the same?
Just tell me if his dick is bigger than mine.
Do you remember the way it was when I was home,
Before I left you all alone.

I wanna be eighty on the porch drinking lemonade with you
And its all that I can think about
Since you told me that you cheated
Eighty on the porch drinking lemonade with you
And its all that I can think about
When you told me that you cheated on me

I knew that you would
I knew cos ya told me IT RUNS IN YOUR family.
And I did the same
So I guess that I deserve half of the blame
Do you remember the way it was for us
Before all of the blow jobs on the bus

And its all that I can think about
When you told me that you cheated
Eighty on the porch drinking lemonade with you
And its all that I can think about
When you told me that you cheated
Told me that you cheated on me

What should I care about the long run
What should it matter to me?
I always knew I'd end up with no one
And now I know the end is here
Cause you've replaced me

Just tell me his name
Just tell me you didn't get laid in our bedroom
Just tell me his name
Just tell me if his dick is bigger than mine
Just tell me his name
Just tell me you didn't get laid in our bedroom
Just tell me his name
Just tell me you didn't get laid in our bedroom
LYRICS
)
a13.tracks.create!(
  name: "You And Your Stoopid Guitar",
  bonus: false,
lyrics: <<-LYRICS
They said lets go to the show,
Can't wait to see them I love that video.
Lets catch the opening band.
Matt said the singers this girl with long red hair
But when she started to play
Thats when he got in her way.
And he was not Brian May.

and I kept trying to hear her
Cause I thought maybe she'd have something to say
But you kept runniing her over
Chasing the fucking spotlight 'round the stage
Oh you think you're so ill
and you're all up in my grill
You and your stoopid guitar.

Ever since I was a kid
Wanted to play on a six string like they did
And join a travelling band
Could have conquered the world with my left hand
And I then I'd sit back and swing
So that the singer could sing
Cause that was always her thing.

But I'm still trying to hear her
Cause I thought maybe she'd have something to say
And you're still running her over
Chasing that fucking spotlight round the stage
Oh you think you're so ill
And you're all up in my grill
You and your stoopid guitar

I'd say nobody plays it like they used to
Just saying no body plays it quite as bad as I do
Not saying nobody plays me like they used too, boo hoo.
Nobody plays, no body plays-ays-ays-ays...
LYRICS
)
a14.tracks.create!(
  name: "Teenage Dirtbag",
  bonus: false,
lyrics: <<-LYRICS
Her name is Noel
I have a dream about her
She rings my bell
I got gym class in half an hour
Oh, how she rocks
In Keds and tube socks
But she doesn't know who I am
And she doesn't give a damn about me

'Cause I'm just a teenage dirtbag baby
Yeah, I'm just a teenage dirtbag baby
Listen to Iron Maiden maybe with me

Her boyfriend's a dick
And he brings a gun to school
And he'd simply kick
My ass if he knew the truth
He lives on my block
And he drives an IROC
But he doesn't know who I am
And he doesn't give a damn about me

'Cause I'm just a teenage dirtbag, baby
Yeah, I'm just a teenage dirtbag, baby
Listen to Iron Maiden maybe with me

Oh, yeah, dirtbag, no, she doesn't know what she's missin'
Oh, yeah, dirtbag, no, she doesn't know what she's missin'

Man, I feel like mold
It's prom night and I am lonely
Lo and behold
She's walking over to me
This must be fake
My lip starts to shake
How does she know who I am?
And why does she give a damn about me

I've got two tickets to Iron Maiden, baby
Come with me Friday, don't say "maybe"
I'm just a teenage dirtbag, baby, like you

Oh, yeah, dirtbag, no, she doesn't know what she's missin'
Oh, yeah, dirtbag, no, she doesn't know what she's missin'
LYRICS
)
