<?php
    foreach($success as $item) { ?>
        <?php if(count($item) == 1) { ?>
            <div class="notification">
                <div class="notification__title notification--success mb-10"><?=$item['title']?></div>
            </div>
        <?php } else if(count($item) == 2) { ?>
            <div class="notification">
                <div class="notification__title notification--success notification--with-description"><?=$item['title']?></div>
                <div class="notification__description"><?=$item['desc']?></div>
            </div>
        <?php } ?>
<?php } ?>