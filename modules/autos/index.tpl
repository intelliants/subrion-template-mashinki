{if isset($category)}
	<div class="page-description">{$category.description}</div>
{/if}

{if 'autos_index_member' == $core.page.name}
	{include file='extra:autos/listing-filters'}
{/if}

{if !empty($models)}
	{ia_block title={lang key='autos_models'} style='fixed' id='auto_categories'}
		<div class="ia-categories">
			{include file='ia-categories.tpl' categories=$models item='autos_models' show_amount=true num_columns=$core.config.autos_model_columns}
		</div>
	{/ia_block}
{/if}

{if !empty($listings)}
	{if !isset($no_sorting)}
		<div class="ia-sorting">
			{lang key='sort_by'}:
			<div class="btn-group">
				<a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
					{if 'release_year' != $sorting.field}
						{lang key=$sorting.field}
					{else}
						{lang key='field_release_year'}
					{/if}
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="{$smarty.const.IA_SELF}?sort=title" rel="nofollow"><span class="fa fa-font"></span> {lang key='title'}</a></li>
					<li><a href="{$smarty.const.IA_SELF}?sort=price" rel="nofollow"><span class="fa fa-dollar"></span> {lang key='price'}</a></li>
					<li><a href="{$smarty.const.IA_SELF}?sort=release_year" rel="nofollow"><span class="fa fa-calendar"></span> {lang key='field_autos_release_year'}</a></li>
					<li><a href="{$smarty.const.IA_SELF}?sort=date" rel="nofollow"><span class="fa fa-clock-o"></span> {lang key='date'}</a></li>
				</ul>
			</div>

			<div class="btn-group">
				<a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
					{if $sorting.direction == 'ASC'}
						{lang key='asc'}
					{else}
						{lang key='desc'}
					{/if}
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="{$smarty.const.IA_SELF}?order=asc" rel="nofollow"><span class="fa fa-long-arrow-down"></span> {lang key='asc'}</a></li>
					<li><a href="{$smarty.const.IA_SELF}?order=desc" rel="nofollow"><span class="fa fa-long-arrow-up"></span> {lang key='desc'}</a></li>
				</ul>
			</div>
		</div>
	{/if}

	<div class="ia-items ia-items--cards">
		{foreach $listings as $listing}
			{include file='extra:autos/list-autos'}
		{/foreach}
	</div>

	{navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit aIgnore=true}
{elseif isset($category.id) && $category.level}
	<div class="alert alert-info">
		{if 'autos_search' == $core.page.name}
			{lang key='nothing_found'}
		{else}
			{lang key='no_listings_to_show'}
		{/if}
	</div>
{elseif !isset($category.id)}
	<div class="alert alert-info">
		{lang key='no_listings_to_show'}
	</div>
{/if}