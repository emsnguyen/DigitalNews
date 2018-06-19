declare 
@index INT = 951527
while @index < (951527+1)
begin
INSERT INTO [Article]
           ([Title]
           ,[AuthorID]
           ,[Content]
		   , ShortDescription
           ,[DatePublished]
           ,[ImagePath])
     VALUES
           ('Making digital news smarter by machine learning ' + cast(@index as varchar(10))
           ,@index
           ,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Suspendisse potenti nullam ac tortor. Ac auctor augue mauris augue neque gravida in fermentum et. Dignissim convallis aenean et tortor at risus viverra. At consectetur lorem donec massa sapien faucibus. Dignissim cras tincidunt lobortis feugiat vivamus at augue eget. Donec ac odio tempor orci. Tempor nec feugiat nisl pretium fusce id velit. Ut venenatis tellus in metus. Massa massa ultricies mi quis hendrerit dolor. Pharetra vel turpis nunc eget lorem dolor. Massa ultricies mi quis hendrerit dolor magna eget est lorem. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare. Odio ut enim blandit volutpat maecenas volutpat blandit aliquam. Id nibh tortor id aliquet lectus proin. Laoreet suspendisse interdum consectetur libero id faucibus nisl. Dictum sit amet justo donec enim diam vulputate. Sit amet consectetur adipiscing elit duis.

Laoreet non curabitur gravida arcu ac tortor dignissim. Tristique senectus et netus et. Tortor at auctor urna nunc id. Sit amet commodo nulla facilisi. Adipiscing elit duis tristique sollicitudin nibh. Cras pulvinar mattis nunc sed blandit. Posuere urna nec tincidunt praesent semper feugiat nibh. Leo vel orci porta non pulvinar. Leo integer malesuada nunc vel risus commodo. Volutpat lacus laoreet non curabitur. Tristique magna sit amet purus gravida quis. Lorem sed risus ultricies tristique nulla aliquet. Ultrices vitae auctor eu augue ut lectus. Et tortor consequat id porta nibh venenatis cras. Etiam erat velit scelerisque in dictum non. In iaculis nunc sed augue lacus. Semper viverra nam libero justo laoreet. Posuere lorem ipsum dolor sit amet consectetur adipiscing. Sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula.

Quam adipiscing vitae proin sagittis nisl rhoncus mattis. Sit amet consectetur adipiscing elit duis tristique. Id cursus metus aliquam eleifend mi in nulla posuere. Adipiscing elit ut aliquam purus sit amet luctus venenatis lectus. Sed felis eget velit aliquet. Non arcu risus quis varius quam quisque id diam vel. Risus in hendrerit gravida rutrum quisque non tellus. Faucibus in ornare quam viverra orci sagittis. Ipsum consequat nisl vel pretium. Nunc sed blandit libero volutpat sed cras ornare. Pulvinar neque laoreet suspendisse interdum. Felis imperdiet proin fermentum leo vel. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Magna etiam tempor orci eu lobortis elementum. Sagittis purus sit amet volutpat consequat mauris. Posuere sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper. Mauris in aliquam sem fringilla ut.

Odio aenean sed adipiscing diam. Nibh sit amet commodo nulla facilisi nullam vehicula. Tristique senectus et netus et. Vel pretium lectus quam id. Cursus vitae congue mauris rhoncus aenean vel elit scelerisque mauris. Gravida rutrum quisque non tellus. Commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae. Sodales ut etiam sit amet nisl. Scelerisque purus semper eget duis at tellus. Posuere urna nec tincidunt praesent semper feugiat nibh sed. Pretium lectus quam id leo in vitae turpis massa. Neque viverra justo nec ultrices. Malesuada pellentesque elit eget gravida cum sociis natoque penatibus et. Neque sodales ut etiam sit amet nisl purus. Orci porta non pulvinar neque laoreet. Massa enim nec dui nunc. Vestibulum sed arcu non odio. Eu consequat ac felis donec et odio pellentesque diam volutpat.

Viverra nam libero justo laoreet sit amet cursus sit. Facilisi morbi tempus iaculis urna id volutpat lacus. Nec dui nunc mattis enim ut tellus elementum sagittis vitae. Rhoncus dolor purus non enim praesent elementum facilisis leo. Blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque. Convallis convallis tellus id interdum velit. Maecenas pharetra convallis posuere morbi leo urna. Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Rutrum quisque non tellus orci ac. Dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu. Venenatis lectus magna fringilla urna porttitor rhoncus. Sagittis orci a scelerisque purus semper eget duis at tellus. Dolor sit amet consectetur adipiscing. Sit amet venenatis urna cursus eget.',
'Praesent semper feugiat nibh. Leo vel orci porta non pulvinar. Leo integer malesuada nunc vel risus commodo. Volutpat lacus laoreet non curabitur. Tristique magna sit amet purus gravida quis. Lorem sed risus ultricies tristique nulla aliquet. Ultrices vitae auctor eu augue ut lectus. Et tortor consequat id porta nibh venenatis cras. '
           ,GETDATE()
           ,'i1.jpg')
		   set @index = @index + 1;
end

update Article set ImagePath = 'i1.jpg' where authorID = 951527