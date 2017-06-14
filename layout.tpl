<!DOCTYPE html>
<html lang="{$core.language.iso}" dir="{$core.language.direction}">
    <head>
        {ia_hooker name='smartyFrontBeforeHeadSection'}

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <title>{ia_print_title}</title>
        <meta name="description" content="{$core.page['meta-description']}">
        <meta name="keywords" content="{$core.page['meta-keywords']}">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="generator" content="Subrion CMS - Open Source Content Management System">
        <meta name="robots" content="index">
        <meta name="robots" content="follow">
        <meta name="revisit-after" content="1 day">
        <base href="{$smarty.const.IA_URL}">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <link rel="shortcut icon" href="{if !empty($core.config.site_favicon)}{$core.page.nonProtocolUrl}uploads/{$core.config.site_favicon}{else}{$core.page.nonProtocolUrl}favicon.ico{/if}">

        {ia_add_media files='jquery, subrion, bootstrap, css:ion.rangeSlider, css:ion.rangeSlider.skinFlat' order=0}
        {ia_print_js files='_IA_TPL_app' order=999}

        {ia_hooker name='smartyFrontAfterHeadSection'}

        {ia_print_css display='on'}

        {ia_add_js}
            intelli.pageName = '{$core.page.name}';

            {foreach $core.customConfig as $key => $value}
                intelli.config.{$key} = '{$value}';
            {/foreach}
        {/ia_add_js}
    </head>

    <body class="page-{$core.page.name}">
        <header class="header"{if $core.config.website_bg} style="background-image: url('{$smarty.const.IA_URL}uploads/{$core.config.website_bg}');"{/if}>
            <div class="inventory">
                <div class="container">
                    {ia_blocks block='inventory'}
                </div>
            </div>

            <nav class="navbar navbar-default">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand navbar-brand--img" href="{$smarty.const.IA_URL}">
                            {if !empty($core.config.site_logo)}
                                <img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
                            {else}
                                <img src="{$img}logo.png" alt="{$core.config.site}">
                            {/if}
                        </a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-collapse">
                        {include file='language-selector.tpl'}
                        {ia_blocks block='account'}
                        {ia_blocks block='mainmenu'}
                    </div>
                </div>
            </nav>

            {if isset($iaBlocks.header)}
                <div class="container">{ia_blocks block='header'}</div>
            {/if}
        </header>

        {if isset($iaBlocks.verytop)}
            <div class="verytop">{ia_blocks block='verytop'}</div>
        {/if}

        {ia_hooker name='smartyFrontBeforeBreadcrumb'}

        {include file='breadcrumb.tpl'}

        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="{width section='content' position='center' tag='col-md-'}">
                        <div class="content__wrap">
                            {ia_hooker name='smartyFrontBeforeNotifications'}
                            {include file='notification.tpl'}

                            {ia_blocks block='top'}

                            <div class="content__header">
                                <h1>{$core.page.title}</h1>
                                <ul class="content__actions">
                                    {foreach $core.actions as $name => $action}
                                        <li>
                                            {if 'action-favorites' == $name}
                                                {printFavorites item=$item itemtype=$item.item}
                                            {else}
                                                <a {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
                                                    <span class="fa fa-{$name}" title="{$action.title}"></span>
                                                </a>
                                            {/if}
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>

                            {ia_hooker name='smartyFrontBeforeMainContent'}

                            {$_content_}

                            {ia_hooker name='smartyFrontAfterMainContent'}
                        </div>

                        {ia_blocks block='bottom'}

                        {if isset($iaBlocks.user1) || isset($iaBlocks.user2)}
                            <div class="row">
                                <div class="{width section='user-blocks' position='user1' tag='col-md-'}">{ia_blocks block='user1'}</div>
                                <div class="{width section='user-blocks' position='user2' tag='col-md-'}">{ia_blocks block='user2'}</div>
                            </div>
                        {/if}
                    </div>
                    <div class="{width section='content' position='right' tag='col-md-'} aside">
                        {ia_blocks block='right'}
                    </div>
                </div>
            </div>
        </div>

        {if isset($iaBlocks.verybottom)}
            <div class="verybottom">
                <div class="container">{ia_blocks block='verybottom'}</div>
            </div>
        {/if}

        <footer class="footer">
            <div class="container">
                {ia_hooker name='smartyFrontBeforeFooterLinks'}

                <div class="row">
                    <div class="col-md-3">
                        <a class="brand brand--in-footer" href="{$smarty.const.IA_URL}">
                            {if !empty($core.config.site_logo)}
                                <img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
                            {else}
                                <img src="{$img}logo.png" alt="{$core.config.site}">
                            {/if}
                        </a>
                        <p>{lang key='copyright_text'}</p>
                        <p>&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}</p>
                    </div>
                    <div class="col-md-2">
                        {ia_blocks block='footer_menu1'}
                    </div>
                    <div class="col-md-2">
                        {ia_blocks block='footer_menu2'}
                    </div>
                    <div class="col-md-5">
                        {if $core.config.website_social}
                            <ul class="social">
                                {if $core.config.website_social_t}<li><a href="{$core.config.website_social_t}" class="twitter"><span class="fa fa-twitter-square"></span></a></li>{/if}
                                {if $core.config.website_social_f}<li><a href="{$core.config.website_social_f}" class="facebook"><span class="fa fa-facebook-square"></span></a></li>{/if}
                                {if $core.config.website_social_g}<li><a href="{$core.config.website_social_g}" class="google-plus"><span class="fa fa-google-plus-square"></span></a></li>{/if}
                                {if $core.config.website_social_i}<li><a href="{$core.config.website_social_i}" class="linkedin"><span class="fa fa-linkedin-square"></span></a></li>{/if}
                            </ul>
                        {/if}
                    </div>
                </div>

                {ia_hooker name='smartyFrontAfterFooterLinks'}
            </div>
        </footer>

        <!-- SYSTEM STUFF -->

        {if $core.config.cron}
            <div style="display: none;">
                <img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
            </div>
        {/if}

        {if isset($manageMode)}
            {include file='visual-mode.tpl'}
        {/if}

        {if isset($previewMode)}
            <p>{lang key='youre_in_preview_mode'}</p>
        {/if}

        {ia_print_js display='on'}

        {ia_hooker name='smartyFrontFinalize'}
    </body>
</html>