# Some things TODO

* Find why the submission of file is so long (Very quick on desktop computers, even if in Virtual Machine)

  hint : while submitting proposition, javac is called three times with 60% CPU and java is called once with 100% CPU. The duration of these calls correspond to the one of the waiting (Java could be for the website as well as for the program execution).



# Some things DONE

* Add an immediate comment on the student page when sending a code (Something like : "<i>Traitement en cours</i>").



* If compilation fails, File not found error -> forward compilation trace into driver_result.txt ?

  Done via Dockerfile : compilation error stream send in a file. If not empty, copying this file into driver_result into a < pre > ... < /pre > tag.

* Find how to force UTF8 for every java File including compilation.
  * Accents from Driver : done (Compiles with -encoding UTF-8)
  * Accents from Student file : done (Execute with "-Dfile.encoding=UTF-8")


* Check wether an exception due to student file produce a crash or not : no more.


* When students upload a proposition, the following error occurs :

  java.lang.IllegalStateException: Response has already been written
  at io.vertx.core.http.impl.HttpServerResponseImpl.checkWritten(HttpServerResponseImpl.java:559)
  at io.vertx.core.http.impl.HttpServerResponseImpl.putHeader(HttpServerResponseImpl.java:156)
  at io.vertx.core.http.impl.HttpServerResponseImpl.putHeader(HttpServerResponseImpl.java:54)
  at io.vertx.blog.plateforme.VerticlePlateforme.lambda$getOneExo$2(VerticlePlateforme.java:211)
  at io.vertx.blog.plateforme.VerticlePlateforme$$Lambda$87/13857537.handle(Unknown Source)
  at io.vertx.ext.mongo.impl.MongoClientImpl.lambda$findBatchWithOptions$4(MongoClientImpl.java:251)
  at io.vertx.ext.mongo.impl.MongoClientImpl$$Lambda$73/20141242.onResult(Unknown Source)
  at com.mongodb.async.client.OperationIterable$4.onResult(OperationIterable.java:142)
  at com.mongodb.async.client.OperationIterable$4.onResult(OperationIterable.java:137)
  at com.mongodb.operation.AsyncQueryBatchCursor.next(AsyncQueryBatchCursor.java:108)
  at com.mongodb.async.client.OperationIterable.loopCursor(OperationIterable.java:137)
  at com.mongodb.async.client.OperationIterable.access$000(OperationIterable.java:32)
  at com.mongodb.async.client.OperationIterable$4.onResult(OperationIterable.java:148)
  at com.mongodb.async.client.OperationIterable$4.onResult(OperationIterable.java:137)
  at com.mongodb.operation.AsyncQueryBatchCursor.next(AsyncQueryBatchCursor.java:104)
  at com.mongodb.async.client.OperationIterable.loopCursor(OperationIterable.java:137)
  at com.mongodb.async.client.OperationIterable.access$000(OperationIterable.java:32)
  at com.mongodb.async.client.OperationIterable$1.onResult(OperationIterable.java:54)
  at com.mongodb.async.client.OperationIterable$1.onResult(OperationIterable.java:48)
  at com.mongodb.internal.async.ErrorHandlingResultCallback.onResult(ErrorHandlingResultCallback.java:53)
  at com.mongodb.async.client.MongoClientImpl$2$1.onResult(MongoClientImpl.java:106)
  at com.mongodb.internal.async.ErrorHandlingResultCallback.onResult(ErrorHandlingResultCallback.java:53)
  at com.mongodb.operation.OperationHelper$ReferenceCountedReleasingWrappedCallback.onResult(OperationHelper.java:180)
  at com.mongodb.operation.FindOperation$2$1$1.onResult(FindOperation.java:548)
  at com.mongodb.operation.FindOperation$2$1$1.onResult(FindOperation.java:542)
  at com.mongodb.internal.async.ErrorHandlingResultCallback.onResult(ErrorHandlingResultCallback.java:53)
  at com.mongodb.connection.DefaultServer$DefaultServerProtocolExecutor$1.onResult(DefaultServer.java:175)
  at com.mongodb.internal.async.ErrorHandlingResultCallback.onResult(ErrorHandlingResultCallback.java:53)
  at com.mongodb.connection.QueryResultCallback.callCallback(QueryResultCallback.java:64)
  at com.mongodb.connection.ResponseCallback.onResult(ResponseCallback.java:48)
  at com.mongodb.connection.ResponseCallback.onResult(ResponseCallback.java:23)
  at com.mongodb.connection.DefaultConnectionPool$PooledConnection$2.onResult(DefaultConnectionPool.java:465)
  at com.mongodb.connection.DefaultConnectionPool$PooledConnection$2.onResult(DefaultConnectionPool.java:459)
  at com.mongodb.connection.UsageTrackingInternalConnection$3.onResult(UsageTrackingInternalConnection.java:127)
  at com.mongodb.connection.UsageTrackingInternalConnection$3.onResult(UsageTrackingInternalConnection.java:123)
  at com.mongodb.internal.async.ErrorHandlingResultCallback.onResult(ErrorHandlingResultCallback.java:53)
  at com.mongodb.connection.InternalStreamConnection.executeCallbackAndReceiveResponse(InternalStreamConnection.java:375)
  at com.mongodb.connection.InternalStreamConnection.access$1700(InternalStreamConnection.java:65)
  at com.mongodb.connection.InternalStreamConnection$ResponseBuffersCallback.onResult(InternalStreamConnection.java:417)
  at com.mongodb.connection.InternalStreamConnection$ResponseBuffersCallback.onResult(InternalStreamConnection.java:386)
  at com.mongodb.connection.InternalStreamConnection$ResponseHeaderCallback.onSuccess(InternalStreamConnection.java:555)
  at com.mongodb.connection.InternalStreamConnection$ResponseHeaderCallback.access$2200(InternalStreamConnection.java:514)
  at com.mongodb.connection.InternalStreamConnection$ResponseHeaderCallback$ResponseBodyCallback.onResult(InternalStreamConnection.java:577)
  at com.mongodb.connection.InternalStreamConnection$ResponseHeaderCallback$ResponseBodyCallback.onResult(InternalStreamConnection.java:561)
  at com.mongodb.connection.InternalStreamConnection$3.completed(InternalStreamConnection.java:444)
  at com.mongodb.connection.InternalStreamConnection$3.completed(InternalStreamConnection.java:441)
  at com.mongodb.connection.AsynchronousSocketChannelStream$BasicCompletionHandler.completed(AsynchronousSocketChannelStream.java:218)
  at com.mongodb.connection.AsynchronousSocketChannelStream$BasicCompletionHandler.completed(AsynchronousSocketChannelStream.java:201)
  at sun.nio.ch.Invoker.invokeUnchecked(Invoker.java:126)
  at sun.nio.ch.Invoker.invokeDirect(Invoker.java:157)
  at sun.nio.ch.UnixAsynchronousSocketChannelImpl.implRead(UnixAsynchronousSocketChannelImpl.java:553)
  at sun.nio.ch.AsynchronousSocketChannelImpl.read(AsynchronousSocketChannelImpl.java:276)
  at sun.nio.ch.AsynchronousSocketChannelImpl.read(AsynchronousSocketChannelImpl.java:297)
  at com.mongodb.connection.AsynchronousSocketChannelStream.readAsync(AsynchronousSocketChannelStream.java:125)
  at com.mongodb.connection.InternalStreamConnection.readAsync(InternalStreamConnection.java:441)
  at com.mongodb.connection.InternalStreamConnection.access$2000(InternalStreamConnection.java:65)
  at com.mongodb.connection.InternalStreamConnection$ResponseHeaderCallback.onResult(InternalStreamConnection.java:537)
  at com.mongodb.connection.InternalStreamConnection$ResponseHeaderCallback.onResult(InternalStreamConnection.java:514)
  at com.mongodb.internal.async.ErrorHandlingResultCallback.onResult(ErrorHandlingResultCallback.java:53)
  at com.mongodb.connection.InternalStreamConnection$3.completed(InternalStreamConnection.java:444)
  at com.mongodb.connection.InternalStreamConnection$3.completed(InternalStreamConnection.java:441)
  at com.mongodb.connection.AsynchronousSocketChannelStream$BasicCompletionHandler.completed(AsynchronousSocketChannelStream.java:218)
  at com.mongodb.connection.AsynchronousSocketChannelStream$BasicCompletionHandler.completed(AsynchronousSocketChannelStream.java:201)
  at sun.nio.ch.Invoker.invokeUnchecked(Invoker.java:126)
  at sun.nio.ch.Invoker.invokeDirect(Invoker.java:157)
  at sun.nio.ch.UnixAsynchronousSocketChannelImpl.implRead(UnixAsynchronousSocketChannelImpl.java:553)
  at sun.nio.ch.AsynchronousSocketChannelImpl.read(AsynchronousSocketChannelImpl.java:276)
  at sun.nio.ch.AsynchronousSocketChannelImpl.read(AsynchronousSocketChannelImpl.java:297)
  at com.mongodb.connection.AsynchronousSocketChannelStream.readAsync(AsynchronousSocketChannelStream.java:125)
  at com.mongodb.connection.InternalStreamConnection.readAsync(InternalStreamConnection.java:441)
  at com.mongodb.connection.InternalStreamConnection.receiveResponseAsync(InternalStreamConnection.java:430)
  at com.mongodb.connection.InternalStreamConnection.executeCallbackAndReceiveResponse(InternalStreamConnection.java:382)
  at com.mongodb.connection.InternalStreamConnection.receiveMessageAsync(InternalStreamConnection.java:366)
  at com.mongodb.connection.UsageTrackingInternalConnection.receiveMessageAsync(UsageTrackingInternalConnection.java:130)
  at com.mongodb.connection.DefaultConnectionPool$PooledConnection.receiveMessageAsync(DefaultConnectionPool.java:459)
  at com.mongodb.connection.SendMessageCallback.onResult(SendMessageCallback.java:45)
  at com.mongodb.connection.SendMessageCallback.onResult(SendMessageCallback.java:22)
  at com.mongodb.connection.DefaultConnectionPool$PooledConnection$1.onResult(DefaultConnectionPool.java:451)
  at com.mongodb.connection.DefaultConnectionPool$PooledConnection$1.onResult(DefaultConnectionPool.java:445)
  at com.mongodb.connection.UsageTrackingInternalConnection$2.onResult(UsageTrackingInternalConnection.java:114)
  at com.mongodb.connection.UsageTrackingInternalConnection$2.onResult(UsageTrackingInternalConnection.java:110)
  at com.mongodb.internal.async.ErrorHandlingResultCallback.onResult(ErrorHandlingResultCallback.java:53)
  at com.mongodb.connection.InternalStreamConnection$2.completed(InternalStreamConnection.java:309)
  at com.mongodb.connection.InternalStreamConnection$2.completed(InternalStreamConnection.java:294)
  at com.mongodb.connection.AsynchronousSocketChannelStream$1.completed(AsynchronousSocketChannelStream.java:111)
  at com.mongodb.connection.AsynchronousSocketChannelStream$1.completed(AsynchronousSocketChannelStream.java:105)
  at com.mongodb.connection.AsynchronousSocketChannelStream$2.completed(AsynchronousSocketChannelStream.java:164)
  at com.mongodb.connection.AsynchronousSocketChannelStream$2.completed(AsynchronousSocketChannelStream.java:158)
  at com.mongodb.connection.AsynchronousSocketChannelStream$AsyncWritableByteChannelAdapter$WriteCompletionHandler.completed(AsynchronousSocketChannelStream.java:190)
  at com.mongodb.connection.AsynchronousSocketChannelStream$AsyncWritableByteChannelAdapter$WriteCompletionHandler.completed(AsynchronousSocketChannelStream.java:181)
  at sun.nio.ch.Invoker.invokeUnchecked(Invoker.java:126)
  at sun.nio.ch.Invoker$2.run(Invoker.java:218)
  at sun.nio.ch.AsynchronousChannelGroupImpl$1.run(AsynchronousChannelGroupImpl.java:112)
  at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
  at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
  at java.lang.Thread.run(Thread.java:745)

  The problem was in improper use of findBatch in getOneExo. The res.result()==null case wasn't considered.
