{if isset($car_blocks_data.body)}
    <div class="bodystyle-list">
        <div class="row">
            {foreach $car_blocks_data.body as $name => $entry}
                <div class="col-md-6">
                    <a href="{$entry.url}" class="bodystyle-list__style bodystyle-list__style--{$name}">
                        <span></span> {$entry.title|escape}
                    </a>
                </div>

                {if $entry@iteration % 2 == 0 && !$entry@last}
                    </div>
                    <div class="row">
                {/if}
            {/foreach}
        </div>
    </div>
{/if}