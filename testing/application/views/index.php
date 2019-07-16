<div class="text-center heade-text">
    <h3 class="text-capitalize">Coming soon</h3>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-12 col-xs-12">
            <?php if ($this->session->flashdata('message')) { ?>
                <div class="alert alert-success">
                    <?php echo $this->session->flashdata('message'); ?>
                </div>
            <?php } ?>
            <?php if ($this->session->flashdata('error')) { ?>
                <div class="alert alert-danger">
                    <?php echo $this->session->flashdata('error'); ?>
                </div>
            <?php } ?>
        </div>
        <form action="" method="POST" enctype="multipart/form-data">
            <div class="col-sm-6 col-xs-12">


            </div>
            <div class="col-sm-6 col-xs-12">



            </div>
        </form>
    </div>
</div>