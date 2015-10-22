{if isset($author)}
	<div class="ia-item-author">
		<a class="ia-item-author__image" href="{ia_url type='url' item='members' data=$author}">
			{printImage imgfile=$author.avatar width=120 title=$author.fullname|default:$author.username gravatar=true email=$author.email}
		</a>
		<div class="ia-item-author__content">
			<h4 class="ia-item__title"><a href="{ia_url type='url' item='members' data=$author}">{$author.fullname}</a></h4>
			<div class="ia-item__additional">
				<p><span class="fa fa-car"></span> {lang key='cars_for_sale'}: <b>{$author.autos_num|string_format:'%d'}</b></p>

				{if $author.phone}
					<p><span class="fa fa-phone"></span> {lang key='field_phone'}: {$author.phone}</p>
				{/if}
			</div>
			<p class="text-center">
				{if isset($author.facebook) && $author.facebook}
					<a href="{$author.facebook}" class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-facebook fa-stack-1x fa-inverse"></i></a>
				{/if}
				{if isset($author.twitter) && $author.twitter}
					<a href="{$author.twitter}" class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-twitter fa-stack-1x fa-inverse"></i></a>
				{/if}
				{if isset($author.gplus) && $author.gplus}
					<a href="{$author.gplus}" class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-google-plus fa-stack-1x fa-inverse"></i></a>
				{/if}
				{if isset($author.linkedin) && $author.linkedin}
					<a href="{$author.linkedin}" class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-linkedin fa-stack-1x fa-inverse"></i></a>
				{/if}
			</p>
		</div>
	</div>
{/if}