# <img src="BubbleTrouble/1.png"></img> IcebRAYkers HubbaBubbaBubbABBAS Bubble Trouble 

<h1> The Idea </h1>
Inspired by one of their favorite childhood games: <a href="https://www.miniclip.com/games/bubble-trouble/en/"><b><i> Bubble Trouble </b></i></a> by Miniclip, Adam and Ray set out to recreate this. Armed with a shaky idea of what physics is, A1 java skills, theoretical Processing skills and a ton of imagination - this is their end product.

<h1> Features </h1>
No, this isn't an exact replica. That would be illegal! But it is a super cool mockup that sacrificed some features and brought in others to make the final game. Here's some of the cool things we have to offer:
<ul>
    <li> Difficulty Levels! Choose between Easy, Medium, and Hard <ul> <li>These control the powerup spawn rate, and bubble lives</li> </ul> </li>
    <li> Powerups! Watch random powerups spawn and fall, giving you things like increased speed or invincibility </li>
    <li> Two Game Modes! <ul>
        <li> Timed Levels <ul>
            <li> In a race against the clock, aim to clear the level of all bubbles. An extra bubble spawns each level - and you have less time! </li>
            </ul>
        </li>
        <li> Free-for-All <ul>
            <li> Try to survive for as long as possible! Clear the screen of all bubbles - only to be met with more! </li>
            </ul>
        </li>
    </ul> </li>
    <li> Stunning visuals! <ul>
        <li> With about 70% of our artwork coming from the internet, how could we go wrong? Check out some epic photoshopped menus, powerups with references to other games and a gorgeous backdrop. </li>
        </ul>
    </li>
</ul>

<h1> Development Log! </h1>
In true Stuyvesant fashion, our development cycle follows an exponential path - it starts off slow and steady and picks up the weekend before its due :) Here's our big milestones:
<ul>
    <li> 5/29/17 <ul>
        <li> We solidify our idea </li>
        <li> We created our initial UML diagram </li>
        </ul>
    </li>
    <li> 5/30/17 <ul>
        <li>The git repository is created! </li>
        </ul>
    </li>
    <li> 6/1/17 <ul>
        <li>Our first big code push </li>
        <li>Created a basic moving player</li>
        <li> Created a very basic moving bubble </li>
        </ul>
    </li>
    <li> 6/2/17 <ul>
        <li> Workingish player and harpoon </li>
        <li> Bubble is moving in a straight path </li>
        </ul>
    </li>
    <li> 6/5/17 - 6/6/17 <ul>
        <li> Person now looks like a... person </li>
        <li> Bubble size makes more sense</li>
        <li> Bubble splitting! </li>
        <li> Bubble bouncing is nicer, but needs to reach a constant height </li>
        </ul>
    </li>
    <li> 6/7/17 <ul>
        <li> Person is now capable of dying </li>
        <li> Harpoon acceleration </li>
        </ul>
    </li>
    <li> 6/9/17 <ul>
        <li> Bubble now splits when it touches the harpoon! </li>
        <li> Level system established! </li>
        </ul>
    </li>
    <li> 6/10/17 - 6/11/17 | This marks the beginning of the 24 hour coding grind. I will attempt to summarize the achievements of this marathon below. <ul>
        <li> Powerups! <ul>
            <li> First established a speed powerup, and then an abstract powerup class </li>
            <li> Random spawning of powerups </li>
            <li> Threading -- to let powerups work on their own </li>
            <li> Fork powerup + invincibility powerup </li>
            </ul>
        </li>
        <li> Visuals! <ul>
            <li> Added a main screen, allowing the user to select their difficulty (custom photoshop hehe) </li>
            <li> Using an actual player sprite + background </li>
            <li> Icons for the powerup </li>
            </ul>
        </li>
        <li> Variation in gameplay: Difficulty/Modes <ul>
            <li> Game can be harder, powerup spawn rates affected as well as split rate </li>
            <li> Two modes: timed and free for all. Timed has 3 levels, where you must destroy all the bubbles before time runs out. Each level has more bubbles and ends more quickly. Free for all involves levels, but has no end. </li>
            </ul>
        </li>
        </ul>
    </li>
</ul>

<h1> Documented Bugs </h1>
<ul>
    <li> Fork Powerup <ul>
        <li> The fork powerups a special lil thing; it makes it so that for the next 3 seconds every harpoon you shoot will come out as 2! While this sounds fantabulous, it's a bit janky from a programming perspective so you might get some weird visual things going on before the harpoons finally split the ball </li>
        </ul>
    </li>
</ul>

<h1> Possible Future Implementations | What Could've Been... </h1>
<ul>
    <li> More powerups! <ul>
        <li> With our nifty abstract class, this wouldn't be hard to do - if we can think it we can implement it </li>
        </ul>
    </li>
    <li> Two Player Mode! <ul>
        <li> With an already existing player class, this could be implemented by creating a second set of everything and mapping new controls. </li>
        </ul>
    </li>
</ul>
