<table width="100%">
<tbody>
  <tr>
    <td>

      <article class="module width_quarter">
        <header><h3>Block Reward Voting</h3></header>
        <div class="module_content">
          <table width="100%">
          <tbody>
          <tr>
            <th align="left" width="60%">Maximum Allowed Vote</th>
            <td>{$VOTINGINFO.maxvote|default:"unknown"}</td>
          </tr>
          <tr>
            <th align="left" width="60%">Current Block Reward</th>
            <td>{$VOTINGINFO.reward|default:"unknown"}</td>
          </tr>
 <tr>
   <td><b>Est Next Reward</b></td>
   <td class="right">{$VOTINGINFO.rewardest|number_format:"0"}</td>
 </tr>
 <tr>
   <td><b>Est Time Until Next</b></td>
   <td class="right">{$VOTINGINFO.rewardnextwhen|default:"Unknown"}</td>
 </tr>


          <tr>
            <th align="left" width="60%">Phase</th>
            <td>{$VOTINGINFO.phase|default:"unknown"}</td>
          </tr>

        </tbody>
        </table>
      </div>
    </article>

{if $VOTINGMETHOD == 'weighted'}

  <article class="module width_quarter">
    <header><h3>Pool Vote</h3></header>
    <div class="module_content">
    <table width="100%">
      <tbody>
        <tr>
          <th width="50%" align="left">Weighted average</td>
          <td>{$AVGVOTE|number_format:"0"}</td>
        </tr>
      </tbody>
    </table>
    </div>
  </article>

</td>
</tr>
</tbody>
</table>

<div>
<article class="module width_half" style="min-height: 350px">
  <header><h3>Pool Block Reward Voting</h3></header>
  <div>
  <table class="tablesorter" cellspacing="0">
    <thead>
      <tr>
        <th align="center">User</th>
        <th align="center">Vote</th>
        <th align="center">Round &#37;</th>
      </tr>
    </thead>
    <tbody>
{section user $USERS}
      <tr class="{cycle values="odd,even"}">
        {if $USERS[user].is_anonymous == 1}
        <td>anonymous</td>
        {else}
        <td>{$USERS[user].username|default:"anonymous"|escape}</td>
        {/if}
        <td align="center">{$USERS[user].vote}</td>
        <td align="center">{(( 100 / $ROUNDSHARES.valid) * $USERS[user].shares.valid)|default:"0"|number_format:"2"}</td>
      </tr>
{/section}
    </tbody>
  </table>
</article>
</div>

{/if}

{if $VOTINGMETHOD == 'finder'}

  <article class="module width_quarter">
    <header><h3>Last Pool Vote</h3></header>
    <div class="module_content">
    <table width="100%">
      <tbody>
        <tr>
          <th width="50%" align="left">Time</th>
          <td>{$BLOCKSFOUND[0].time|date_format:"%d/%m %H:%M:%S"|default:"unknown"}</td>
        </tr>
        <tr>
          <th width="50%" align="left">Finder</th>
          <td width="50%">{if $BLOCKSFOUND[0].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}anonymous{else}{$BLOCKSFOUND[0].finder|default:"unknown"|escape}{/if}</td>
        </tr>
        <tr>
          <th width="50%" align="left">Vote</th>
          <td width="50%">{$BLOCKSFOUND[0].vote|default:"unknown"}</td>
        </tr>
      </tbody>
    </table>
    </div>
  </article>

      <article class="module width_quarter">
        <header><h3>Voting Phase</h3></header>
        <div class="module_content">
        <h3>{$VOTINGINFO.phase|default:"unknown"}</h3>
        {if $VOTINGINFO.phase == "Mint"}
          <p>45,000,000 HVC</p>
          <p>Votes affect the duration of the initial minting. The larger the block reward, the quicker the 45M coins will be awarded.</p>
          <p>Duration: 72 days to 25+ years (depending on votes)</p>
        {/if}
        {if $VOTINGINFO.phase == "Limit"}
          <p>63,476 blocks</p>        
          <p>Votes affect the final money supply. The smaller the block reward, the smaller the supply. Maximum possible supply is 128M coins.</p>
          <p>Duration: 56 days (fixed)</p>
        {/if}
        {if $VOTINGINFO.phase == "Sustain"}
          <p>10,000,576 coins</p>        
          <p>Votes affect the duration of the long term sustainment of the network. The largest possible vote is reduced to 8.</p>
          <p>Duration: 4.7 years to 38+ years (depending on votes)</p>
        {/if}
          <p>Info: <a href="http://heavycoin.github.io/about.html#decentralised-voting" target="_blank">heavycoin.github.io</a>
      </div>

    </article>


</td>
</tr>
</tbody>
</table>

<article class="module width_full">
  <header><h3>Last {$BLOCKLIMIT} Blocks Found</h3></header>
  <table class="tablesorter" cellspacing="0">
    <thead>
      <tr>
        <th align="center">Block</th>
        <th align="center">Validity</th>
        <th>Finder</th>
        <th>Vote</th>
        <th align="center">Time</th>
        <th align="center">Difficulty</th>
        <th align="center">Amount</th>
      </tr>
    </thead>
    <tbody>
{assign var=count value=0}
{assign var=totalexpectedshares value=0}
{assign var=totalshares value=0}
{assign var=pplnsshares value=0}
{section block $BLOCKSFOUND}
      {assign var="totalshares" value=$totalshares+$BLOCKSFOUND[block].shares}
      {assign var="count" value=$count+1}
      {if $GLOBAL.config.payout_system == 'pplns'}{assign var="pplnsshares" value=$pplnsshares+$BLOCKSFOUND[block].pplns_shares}{/if}
      <tr class="{cycle values="odd,even"}">
{if ! $GLOBAL.website.blockexplorer.disabled}
        <td align="center"><a href="{$smarty.server.SCRIPT_NAME}?page=statistics&action=round&height={$BLOCKSFOUND[block].height}">{$BLOCKSFOUND[block].height}</a></td>
{else}
        <td align="center">{$BLOCKSFOUND[block].height}</td>
{/if}
        <td align="center">
{if $BLOCKSFOUND[block].confirmations >= $GLOBAL.confirmations}
          <span class="confirmed">Confirmed</span>
{else if $BLOCKSFOUND[block].confirmations == -1}
          <span class="orphan">Orphan</span>
{else}
          <span class="unconfirmed">{$GLOBAL.confirmations - $BLOCKSFOUND[block].confirmations} left</span>
{/if}
        </td>
        <td>{if $BLOCKSFOUND[block].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}anonymous{else}{$BLOCKSFOUND[block].finder|default:"unknown"|escape}{/if}</td>
        <td>{$BLOCKSFOUND[block].vote}</td>
        <td align="center">{$BLOCKSFOUND[block].time|date_format:"%d/%m %H:%M:%S"}</td>
        <td align="center">{$BLOCKSFOUND[block].difficulty|number_format:"2"}</td>
        <td align="center">{$BLOCKSFOUND[block].amount|number_format:"2"}</td>
      </tr>
{/section}
    </tbody>
  </table>
</article>

{/if}

