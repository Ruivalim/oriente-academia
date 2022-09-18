<script>
	import Fa from 'svelte-fa/src/fa.svelte';
	import { faBars } from '@fortawesome/free-solid-svg-icons';

	let navbar_open = false;

	const close_navbar = () => {
		navbar_open = false;
	};
</script>

<nav id="nav-bar" class={navbar_open ? 'open' : ''}>
	<button class="closebtn" on:click={close_navbar}>&times;</button>
	<a href="/" on:click={close_navbar}>Inicio</a>
	<a href="/kung-fu" on:click={close_navbar}>Kung Fu</a>
	<a href="/taekwondo" on:click={close_navbar}>Taekwondo</a>
	<a href="/tai-chi" on:click={close_navbar}>Tai Chi</a>
	<a href="/boxe" on:click={close_navbar}>Boxe</a>
	<a href="/blog" on:click={close_navbar}>Blog</a>
</nav>

<header>
	<button on:click={() => (navbar_open = true)}>
		<Fa icon={faBars} />
	</button>
	<a href="/"><img src="/logo.png" alt="Oriente Academia" /></a>
	<div>
		<a href="https://www.instagram.com/oriente.academia/" target="_blank"
			><img width="25" height="25" src="/instagram.png" alt="Instagram Oriente Academia" /></a
		>
	</div>
</header>

<main>
	<slot />
</main>

<style lang="sass">
	#nav-bar
		height: 100%
		width: 250px
		position: fixed
		z-index: 1
		top: 0
		left: -250px
		background-color: #111
		overflow-x: hidden
		padding-top: 60px
		transition: 0.5s
		&.open
			left: 0px

		// the close button stays on the top right corner and is always visible and its white and no background
		.closebtn
			position: absolute
			top: 0
			font-size: 36px
			right: 9px
			color: white
			background: none
			border: none

		a
			padding: 8px 8px 8px 32px
			text-decoration: none
			font-size: 25px
			color: #818181
			display: block
			transition: 0.3s
			&:hover
				color: #f1f1f1

	header
		padding: 5px
		width: 100%
		position: fixed
		top: 0px
		background: linear-gradient(rgba(247, 148, 30, 1), rgba(244, 121, 32, 1))
		display: flex
		justify-content: space-between
		align-items: center

		button
			background: none
			border: none
			font-size: 25px
			cursor: pointer
			color: white
			display: inline-block

		div	
			margin-right: 10px
		

	main
		margin-top: 75px
		padding: 5px
</style>
