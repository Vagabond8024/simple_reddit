abstract class ThreeWayMapper<D, L, R> {
  L remoteToLocal(R type);

  D localToDomain(L type);

  L domainToLocal(D type);

  D remoteToDomain(R type);
}
