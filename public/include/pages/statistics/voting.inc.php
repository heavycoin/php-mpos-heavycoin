<?php

function sorter($a, $b)
{
    return $a['shares']['valid'] < $b['shares']['valid'];
}

$smarty->assign("VOTINGMETHOD", $config['voting_method']);
$smarty->assign("VOTINGINFO", array('phase'  => $bitcoin->getphase(),
                                    'maxvote'  => $bitcoin->getmaxvote(),
                                    'reward' => $bitcoin->getreward(),
                                    'rewardest' => $bitcoin->getnextrewardestimate(),
                                    'rewardnextwhen' => $bitcoin->getnextrewardwhenstr()
));

if ($config['voting_method'] == 'finder')
{
    $smarty->assign("BLOCKSFOUND", $statistics->getBlocksFound(20));
    $smarty->assign("BLOCKLIMIT", 20);
}
else
{

  if ($aUsers = $statistics->getAllUserStats('', 100000, $start))
  {

    // Get total shares for this round, since last block found
    $roundShares = $statistics->getRoundShares();

    $weightedVotes = 0;
    foreach($aUsers as $key => $aData)
    {
        if ($aUsers[$key]['shares']['valid'] > 0)
        {
            $weightedVotes += $aUsers[$key]['vote'] * ($aUsers[$key]['shares']['valid'] / $roundShares['valid']);
        }
    }

    usort($aUsers, "sorter");

    // Assign our variables
    $smarty->assign("ROUNDSHARES", $roundShares);
    $smarty->assign("AVGVOTE", $weightedVotes);
    $smarty->assign("USERS", $aUsers);
  } else {
    $_SESSION['POPUP'][] = array('CONTENT' => 'Could not find any users', 'TYPE' => 'errormsg');
  }
}

// Tempalte specifics
$smarty->assign("CONTENT", "default.tpl");
?>




